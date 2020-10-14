class CreateDiscords < ActiveRecord::Migration[6.0]
  def change
    create_table :discords do |t|
      t.string :discord_url

      t.timestamps
    end
  end
end
