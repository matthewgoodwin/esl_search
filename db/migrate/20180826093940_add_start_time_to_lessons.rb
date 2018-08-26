class AddStartTimeToLessons < ActiveRecord::Migration[5.0]
  def change
    add_column :lessons, :lesson_start, :time
  end
end
