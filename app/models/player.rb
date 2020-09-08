class Player < ApplicationRecord
  belongs_to :user, class_name: User.name
  belongs_to :game, class_name: Game.name
  belongs_to :rank, class_name: Rank.name

  PLAYER_PARAMS = %i(game_id rank_id).freeze
end
