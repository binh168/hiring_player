require "rails_helper"
require "rspec/active_model/mocks"
include ActiveSupport::Testing::TimeHelpers

RSpec.describe UserMailer, type: :mailer do
  let(:user) { create :user }
  let(:other_user) { create :user }
  let(:order){ create(:order) }
  let(:order_params) do 
    {
      receiver_id: user.id,
      actionable_id: order.id
    }
  end

  before do
    travel_to(Date.today - 1) 
    other_user.active_order.create order_params
    travel_back
    stub_const("ENV", {"EXAMPLE_ENV" => "example env"})
  end

  let(:o_actionable){user.passive_order.first}
  let(:mail) { UserMailer.order_mailer(user).deliver_now }

  it "sends email to user" do
    expect{mail}.to change { ActionMailer::Base.deliveries.count }.by(1)
    expect(mail.to).to eq [user.email]
  end

  it "checks mail's content" do
    expect(mail.body).to include(o_actionable.sender.name )
    expect(mail.body).to include(o_actionable.actionable.rental_period )
    expect(mail.body).to include(o_actionable.actionable.cost )
    expect(mail.body).to include(o_actionable.actionable.status)
  end
end
