class MoveNameToInfo < ActiveRecord::Migration
  def change
    remove_column :universities, :name
    add_column :infos, :name, :string
  end
end
