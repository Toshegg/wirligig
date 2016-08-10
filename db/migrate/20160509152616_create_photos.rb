class CreatePhotos < ActiveRecord::Migration
  def change
    create_table :photos do |t|
      t.integer :university_id
      t.string :category
      t.attachment :image
    end
  end
end
