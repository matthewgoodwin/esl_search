class AddKakaoIdToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :user_kakao_id, :string
  end
end
