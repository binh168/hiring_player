require 'rails_helper'
RSpec.describe RatingsController, type: :controller do
  let(:current_user){ FactoryBot.create(:user) }
  let(:other_user){ FactoryBot.create(:user) }
  let(:rating) { FactoryBot.create(:rating) }
  let(:rating_actionable){SenderRecipient.create(sender_id: current_user.id,
    receiver_id: other_user.id, actionable_type: Rating.name, 
    actionable_id: rating.id)
  }
  
  describe "POST #create" do
    describe "create new rating" do
      context "create new rating success" do
        it{expect{rating}.to change{Rating.count}.by(1)}
      end
    end

    describe "create new rating actionable" do
      context "create new rating success" do
        it{expect{rating_actionable}.to change { SenderRecipient.count }.by(1) }
      end
    end
  end
end
