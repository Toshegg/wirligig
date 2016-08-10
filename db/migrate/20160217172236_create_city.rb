class CreateCity < ActiveRecord::Migration
  def change
    create_table :cities do |t|
      t.string :name
      t.integer :country_id
      t.integer :living_cost

      t.timestamps
    end
  end
end
