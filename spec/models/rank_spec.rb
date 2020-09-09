require 'rails_helper'

RSpec.describe Rank, type: :model do
  describe "Associations" do
    it {is_expected.to belong_to(:game).class_name(Game.name) }
    it do
      is_expected.to have_many(:player).class_name(Player.name)
      .with_foreign_key(:rank_id)
    end
  end
end
