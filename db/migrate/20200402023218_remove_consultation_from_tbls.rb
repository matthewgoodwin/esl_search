class RemoveConsultationFromTbls < ActiveRecord::Migration[5.2]
  def change
    remove_reference :appointments, :consultation, foreign_key: true
    # rails g migration RemoveConsultationFromAppointments consultation:references
    remove_reference :lessons, :consultation, foreign_key: true
    # rails g migration RemoveConsultationFromLessons consultation:references
    remove_reference :messages, :consultation, foreign_key: true
    # rails g migration RemoveConsultationFromMessages consultation:references
    remove_reference :reviews, :consultation, foreign_key: true
    # rails g migration RemoveConsultationFromReviews consultation:references
  end
end
