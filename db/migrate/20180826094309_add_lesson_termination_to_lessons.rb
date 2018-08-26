class AddLessonTerminationToLessons < ActiveRecord::Migration[5.0]
  def change
    add_column :lessons, :lesson_terminate, :datetime
  end
end
