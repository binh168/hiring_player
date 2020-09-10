require 'rails_helper'

RSpec.describe Game, type: :model do
  describe "Associations" do
    it do
      is_expected.to have_many(:rank).class_name(Rank.name)
        .with_foreign_key(:game_id)
    end
    it do
      is_expected.to have_many(:player).class_name(Player.name)
        .with_foreign_key(:game_id)
    end
  end
end
