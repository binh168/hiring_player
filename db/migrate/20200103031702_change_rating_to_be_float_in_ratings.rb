class ChangeRatingToBeFloatInRatings < ActiveRecord::Migration[6.0]
  def up
    change_column :comments, :comment, :text
  end

  def down
    change_column :comments, :comment, :float
  end
end
