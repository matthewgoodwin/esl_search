class JobPost < ApplicationRecord
  belongs_to :user

  validates :job_lang, :job_type, :job_period, :job_expert, :job_desc, presence: true
end
