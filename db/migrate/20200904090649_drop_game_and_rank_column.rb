class DropGameAndRankColumn < ActiveRecord::Migration[6.0]
  def change
    remove_column :user_profiles, :game, :string
    remove_column :user_profiles, :rank, :string
  end
end
