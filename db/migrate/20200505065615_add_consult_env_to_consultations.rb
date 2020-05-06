class AddConsultEnvToConsultations < ActiveRecord::Migration[6.0]
  def change
    add_column :consultations, :consult_env, :string
  end
end
