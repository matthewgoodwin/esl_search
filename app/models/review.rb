class Review < ApplicationRecord
  belongs_to :consultation
  belongs_to :user

  validates :review_title, :punct, :prep, :org, :know, :comm, :adapt, :respond, :succ, presence: true
  validates :ravg, numericality: { only_float: true }
  validates :ravg, inclusion: { in: (1..5), message: "Your rating should be between 1 and 5!" }
  # validates :user, uniqueness: { scope: :email, message: "you can only create one review!"}
  private
  # method called before saving user review
  def self.ravg_star(element)
    int_array = []
    # element = <ActionController::Parameters { "punct"=>"4", "prep"=>"4", [...], "succ"=>"4"} permitted: true>
    @e = element.values
    #  {:key => value} => @e = ["4", "4", "4"]
    int_array = @e.map(&:to_i)
    # ^ converts array of "stings" => [4,4,4]
    rev_sum = int_array.sum
    # rev_sum = 12
    avg_star = (rev_sum.to_f / int_array.size)
    # ^ size#arrays; length#strings
    # ^ count#return values
    # raise
  end
end
