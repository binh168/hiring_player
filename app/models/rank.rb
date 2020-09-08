class Rank < ApplicationRecord
  belongs_to :game, class_name: Game.name
  has_many :player, class_name: Player.name, foreign_key: :rank_id
end
