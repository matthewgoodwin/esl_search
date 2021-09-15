class CreateJobPosts < ActiveRecord::Migration[6.1]
  def change
    create_table :job_posts do |t|
      t.string :job_lang
      t.string :job_type
      t.string :job_demo
      t.string :job_period
      t.string :job_env
      t.integer :job_expert
      t.text :job_desc
      t.decimal :job_fee_low, precision: 19, scale: 2
      t.decimal :job_fee_high, precision: 19, scale: 2
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
