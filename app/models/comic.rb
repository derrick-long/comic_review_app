class Comic < ApplicationRecord
  has_many :reviews, dependent: :destroy
  belongs_to :user
  validates :title, presence: true
  validates :author, presence: true, length: { minimum: 4 }
  validates :description, length: { in: 10..250 }, allow_blank: true

end
