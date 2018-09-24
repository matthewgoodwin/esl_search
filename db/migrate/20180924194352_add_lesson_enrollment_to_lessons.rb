class AddLessonEnrollmentToLessons < ActiveRecord::Migration[5.0]
  def change
    add_column :lessons, :lesson_enrollment, :text, array: true, default: []
  end
end
