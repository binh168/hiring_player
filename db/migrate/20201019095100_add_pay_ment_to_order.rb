class AddPayMentToOrder < ActiveRecord::Migration[6.0]
  def change
    add_column :orders, :payment, :boolean, default: false
  end
end
