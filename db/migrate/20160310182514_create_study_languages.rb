class CreateStudyLanguages < ActiveRecord::Migration
  def change
    create_table :study_languages do |t|
      t.string :name
    end
  end
end
