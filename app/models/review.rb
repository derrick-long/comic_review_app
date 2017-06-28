class Review < ApplicationRecord
  has_many :votes, dependent: :destroy
  belongs_to :user
  belongs_to :comic
  validates :content, length: { in: 10..700 }, presence: true
  validates :rating, numericality: { only_integer: true },
            presence: true, inclusion: { in: 1..5 }
#add dependent delete

  def vote_count
    self.votes.sum(:value)
  end

  # so this should return the correct vote object,  which I can then use
# to link to my edit and destroy functions
end
