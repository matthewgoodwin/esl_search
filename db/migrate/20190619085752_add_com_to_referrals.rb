class AddComToReferrals < ActiveRecord::Migration[5.0]
  def change
    add_column :referrals, :comment, :text
  end
end
