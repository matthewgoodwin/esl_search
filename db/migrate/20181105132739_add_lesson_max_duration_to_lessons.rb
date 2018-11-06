class AddLessonMaxDurationToLessons < ActiveRecord::Migration[5.0]
  def change
    add_column :lessons, :lesson_max_dur, :integer
  end
end
