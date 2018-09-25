class AddTimeOneToLessons < ActiveRecord::Migration[5.0]
  def change
    add_column :lessons, :lesson_start, :datetime
  end
end
