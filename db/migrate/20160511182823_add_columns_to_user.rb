class AddColumnsToUser < ActiveRecord::Migration
  def change
    add_column :users, :is_admin, :boolean, default: false
    add_column :users, :payed, :boolean, default: false
  end
end
