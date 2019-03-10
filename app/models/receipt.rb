class Receipt < ApplicationRecord
  belongs_to :consultation

  validates :invoice_num, presence: :true
end
