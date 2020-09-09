class CreatePlayers < ActiveRecord::Migration[6.0]
  def change
    create_table :players do |t|
      t.references :user, foreign_key: true
      t.references :game, foreign_key: true
      t.references :rank, foreign_key: true

      t.timestamps
    end
  end
end
