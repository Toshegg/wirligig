class CreateCourses < ActiveRecord::Migration
  def change
    create_table :courses do |t|
      t.integer :info_id
      t.string :name
      t.integer :price
    end
  end
end
