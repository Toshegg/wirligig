class CreateInfoStudyLanguage < ActiveRecord::Migration
  def change
    create_table :infos_study_languages do |t|
      t.integer :info_id
      t.integer :study_language_id
    end
  end
end
