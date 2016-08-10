class AddCostToCity < ActiveRecord::Migration
  def change
    add_column :cities, :cost_from, :integer
    add_column :cities, :cost_to, :integer
  end
end
