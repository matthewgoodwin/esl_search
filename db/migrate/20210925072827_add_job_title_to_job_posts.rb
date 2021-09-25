class AddJobTitleToJobPosts < ActiveRecord::Migration[6.1]
  def change
    add_column :job_posts, :job_title, :string
  end
end
