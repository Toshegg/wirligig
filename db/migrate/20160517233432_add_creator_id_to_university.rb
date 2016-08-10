class AddCreatorIdToUniversity < ActiveRecord::Migration
  def change
    add_column :universities, :creator_id, :integer
  end
end
