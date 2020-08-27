require 'rails_helper'

RSpec.describe "Messengers", type: :request do
  let(:user) { FactoryBot.create(:user) }
  let(:other_user) { FactoryBot.create(:user) }
  let(:message_params) do 
    {
      message: "message",
      user_id: user.id,
      receiver: other_user.id
    }
  end

  before(:each) do
    log_in_as user
  end

  describe "POST messengers#create" do
    describe "create new message" do
      it{expect{post user_messengers_path(user.id), params: message_params}
        .to change{Messenger.count}.by(1)
        .and change{SenderRecipient.count}.by(1)
      }
    end
  end
end
