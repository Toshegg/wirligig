class MoveInfoColumnsToUniversity < ActiveRecord::Migration
  def up
    change_table :infos do |t|
      t.remove :foreign_students
      t.remove :admission_from
      t.remove :admission_to
      t.remove :pass_exams_from
      t.remove :pass_exams_to
      t.remove :provides_dormitory
      t.remove :show_name
    end

    change_table :universities do |t|
      t.boolean :foreign_students, default: false
      t.datetime :admission_from
      t.datetime :admission_to
      t.datetime :pass_exams_from
      t.datetime :pass_exams_to
      t.boolean :provides_dormitory, default: false
      t.boolean :show_name, default: false
    end
  end

  def down
    change_table :universities do |t|
      t.remove :foreign_students
      t.remove :admission_from
      t.remove :admission_to
      t.remove :pass_exams_from
      t.remove :pass_exams_to
      t.remove :provides_dormitory
      t.remove :show_name
    end

    change_table :infos do |t|
      t.boolean :foreign_students, default: false
      t.datetime :admission_from
      t.datetime :admission_to
      t.datetime :pass_exams_from
      t.datetime :pass_exams_to
      t.boolean :provides_dormitory, default: false
      t.boolean :show_name, default: false
    end

  end
end
