class CreateRanks < ActiveRecord::Migration[6.0]
  def change
    create_table :ranks do |t|
      t.string :rank
      t.references :game, foreign_key: true
      t.timestamps
    end
  end
end
