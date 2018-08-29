class AddLevelToLessons < ActiveRecord::Migration[5.0]
  def change
    add_column :lessons, :lesson_level, :string
  end
end
