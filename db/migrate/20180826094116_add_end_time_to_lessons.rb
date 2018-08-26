class AddEndTimeToLessons < ActiveRecord::Migration[5.0]
  def change
    add_column :lessons, :lesson_end, :time
  end
end
