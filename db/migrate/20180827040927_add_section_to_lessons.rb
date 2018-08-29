class AddSectionToLessons < ActiveRecord::Migration[5.0]
  def change
    add_column :lessons, :lesson_section, :integer
  end
end
