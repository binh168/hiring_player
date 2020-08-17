require 'rails_helper'

RSpec.describe CommentsController, type: :controller do
  let(:current_user){ FactoryBot.create(:user) }
  let(:other_user){ FactoryBot.create(:user) }
  let(:comment) { FactoryBot.create(:comment) }

  describe "POST #create" do
    describe "create new comment" do
      context "create new comment success" do
        it{expect{comment}.to change{Comment.count}.by(1)}
      end
    end

    describe "create new comment actionable" do
      let(:comment_actionable){SenderRecipient.create(sender_id: current_user.id,
        receiver_id: other_user.id, actionable_type: Comment.name, 
        actionable_id: comment.id)
      }
      context "create new comment success" do
        it{expect{comment_actionable}.to change { SenderRecipient.count}.by(1) }
      end
    end
  end
end
