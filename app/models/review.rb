class Review < ApplicationRecord
  belongs_to :user
  belongs_to :comic
  validates :content, length: { in: 10..700 }, presence: true
  validates :rating, numericality: { only_integer: true },
            presence: true, inclusion: { in: 1..5 }

end
 
