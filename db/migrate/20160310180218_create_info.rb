class CreateInfo < ActiveRecord::Migration
  def change
    create_table :infos do |t|
      t.string :web_site
      t.boolean :foreign_students
      t.timestamp :admission_from
      t.timestamp :admission_to
      t.timestamp :pass_exams_from
      t.timestamp :pass_exams_to
      t.text :note
      t.boolean :provides_dormitory
      t.boolean :show_name
      t.integer :language_code_id

      t.timestamps
    end
  end
end
