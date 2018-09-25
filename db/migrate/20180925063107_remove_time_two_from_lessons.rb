class RemoveTimeTwoFromLessons < ActiveRecord::Migration[5.0]
  def change
    remove_column :lessons, :lesson_end, :time
  end
end
