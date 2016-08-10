class CreateGraduate < ActiveRecord::Migration
  def change
    create_table :graduates do |t|
      t.string :name
    end
  end
end
