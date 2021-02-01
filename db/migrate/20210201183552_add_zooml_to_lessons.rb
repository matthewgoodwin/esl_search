class AddZoomlToLessons < ActiveRecord::Migration[6.0]
  def change
    add_column :lessons, :remote_link, :string
  end
end
