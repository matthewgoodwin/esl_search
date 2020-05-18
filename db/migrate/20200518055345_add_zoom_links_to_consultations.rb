class AddZoomLinksToConsultations < ActiveRecord::Migration[6.0]
  def change
    add_column :consultations, :consult_zoom_link, :string
  end
end
