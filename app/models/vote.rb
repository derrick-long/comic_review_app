class Vote < ApplicationRecord
  belongs_to :user
  belongs_to :review
  validates :value, inclusion: { in: [-1, 0, 1]}
  #need a validation to make sure thats set up
  #then we need counter cache
  #also functionality should be such that when submitted
  #we're just clicking one button or another


end
