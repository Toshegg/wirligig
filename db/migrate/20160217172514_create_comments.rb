class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.integer :user_id
      t.text :message
      t.string :entity_type
      t.integer :entity_id

      t.timestamps
    end
  end
end
