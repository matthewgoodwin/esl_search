class AddLessonDowToLessons < ActiveRecord::Migration[5.0]
  def change
    add_column :lessons, :lesson_dow, :text, array: true, default: []
  end
end
