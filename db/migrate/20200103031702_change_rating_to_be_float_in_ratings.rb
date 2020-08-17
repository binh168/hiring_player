class ChangeRatingToBeFloatInRatings < ActiveRecord::Migration[6.0]
  def up
    change_column :ratings, :rating, :decimal, precision: 10, scale: 2
    change_column :comments, :comment, :text
  end

  def down
    change_column :ratings, :rating, :int
    change_column :comments, :comment, :float
  end
end
