class RemoveTimeOneFromLessons < ActiveRecord::Migration[5.0]
  def change
    remove_column :lessons, :lesson_start, :time
  end
end
