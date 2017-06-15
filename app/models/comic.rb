class Comic < ApplicationRecord
  belongs_to :genre
  has_many :reviews, dependent: :destroy
  belongs_to :user
  validates :title, presence: true, uniqueness: true
  validates :author, presence: true, length: { minimum: 4 }
  validates :description, length: { in: 10..250 }, allow_blank: true
end
