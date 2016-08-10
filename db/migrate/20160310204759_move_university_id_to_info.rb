class MoveUniversityIdToInfo < ActiveRecord::Migration
  def change
    remove_column :universities, :info_id
    add_column :infos, :university_id, :integer
  end
end
