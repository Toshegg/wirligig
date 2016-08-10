class CreateUniversity < ActiveRecord::Migration
  def change
    create_table :universities do |t|
      t.string :name
      t.integer :country_id
      t.integer :city_id
      t.integer :rating
      t.integer :info_id

      t.timestamps
    end
  end
end
