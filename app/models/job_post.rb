class JobPost < ApplicationRecord
  belongs_to :user

  validates :job_title, :job_lang, :job_type, :job_period, :job_expert, :job_desc, presence: true

  def set_job_expert(element)
    case element.job_expert
    when 1
      job_expert = ["fas fa-chess-pawn", "< 1 year(년)"]
    when 2
      job_expert = ["fas fa-chess-knight", "1 - 3 years(년)"]
    when 3
      job_expert = ["fas fa-chess-bishop", "3 - 5 years(년)"]
    when 4
      job_expert = ["fas fa-chess-rook", "5 - 10 years(년)"]
    when 5
      job_expert = ["fas fa-chess-queen", "10+ years(년)"]
    end #end of case
  end # end of def
end # end of JobPost
