require 'rails_helper'

RSpec.describe Player, type: :model do
  describe "Associations" do
    it { is_expected.to belong_to(:user).class_name(User.name) }
    it { is_expected.to belong_to(:game).class_name(Game.name) }
    it { is_expected.to belong_to(:rank).class_name(Rank.name) }
  end
end
