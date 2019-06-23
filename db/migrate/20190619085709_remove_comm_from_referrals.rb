class RemoveCommFromReferrals < ActiveRecord::Migration[5.0]
  def change
    remove_column :referrals, :comment, :string
  end
end
