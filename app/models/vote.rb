class Vote < ApplicationRecord
  belongs_to :user
  belongs_to :review
  validates :value, inclusion: { in: -1..1 }, presence: true, numericality: true
  validates :review_id, presence: true
  validates :user_id, presence: true
  #need a validation to make sure thats set up
  #then we need counter cache
  #also functionality should be such that when submitted
  #we're just clicking one button or another
end
