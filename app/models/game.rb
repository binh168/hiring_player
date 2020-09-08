class Game < ApplicationRecord
  has_many :rank, class_name: Rank.name, foreign_key: :game_id
  has_many :player, class_name: Player.name, foreign_key: :game_id
end
