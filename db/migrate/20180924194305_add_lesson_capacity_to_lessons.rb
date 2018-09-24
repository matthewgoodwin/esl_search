class AddLessonCapacityToLessons < ActiveRecord::Migration[5.0]
  def change
    add_column :lessons, :lesson_capacity, :integer
  end
end
