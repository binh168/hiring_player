require 'rails_helper'
require 'rubygems'
require 'zip'
require 'csv'

RSpec.describe "DownloadZipService" do
  let(:user){ create(:user) }
  let(:other_user) { create(:user) }
  let(:messenger){ create(:messenger)}
  let(:order){ create(:order) }
  let(:message_params) do 
    {
      receiver_id: other_user.id,
      actionable_id: messenger.id
    }
  end
  let(:order_params) do 
    {
      receiver_id: other_user.id,
      actionable_id: order.id
    }
  end
  before do
    user.active_messenger.create message_params
    user.active_order.create order_params
  end
  let(:m_actionable){user.active_messenger.first}
  let(:o_actionable){user.active_order.first}
  
  let(:from){"2020-09-10"}
  let(:to){"2020-09-30"}
  subject { DownloadZipService.new(from, to, user) }
  describe "#perform" do
    it "exports zip file" do
      Zip::InputStream.open(subject.perform) do |io|
        while (entry = io.get_next_entry)
          expect(io.read).to include("#{m_actionable.receiver.name},#{m_actionable.actionable.message},#{m_actionable.created_at}")
            .or include("#{o_actionable.receiver.name},#{o_actionable.actionable.cost},#{o_actionable.actionable.rental_period},#{o_actionable.created_at}")
          expect(entry.name).to eq("messengers-#{from}-#{to}.csv")
            .or eq("orders-#{from}-#{to}.csv")
        end
      end
    end
  end
end
