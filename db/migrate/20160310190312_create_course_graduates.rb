class CreateCourseGraduates < ActiveRecord::Migration
  def change
    create_table :courses_graduates do |t|
      t.integer :course_id
      t.integer :graduate_id
    end
  end
end
