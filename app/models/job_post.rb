class JobPost < ApplicationRecord
  belongs_to :user

  validates :job_title, :job_lang, :job_type, :job_period, :job_expert, :job_desc, presence: true

  def set_job_expert(element)
    case element.job_expert
    when 1
      job_expert = "fas fa-chess-pawn"
    when 2
      job_expert = "fas fa-chess-knight"
    when 3
      job_expert = "fas fa-chess-bishop"
    when 4
      job_expert = "fas fa-chess-rook"
    when 5
      job_expert = "fas fa-chess-queen"
    end #end of case
  end # end of def
end # end of JobPost
