class Comic < ApplicationRecord
  belongs_to :user
  validates :title, presence: true
  validates :author, presence: true, length: { minimum: 4 }
  validates :description, length: { in: 10..250 }, allow_blank: true
  #so needs to belong to user
  #but will have many comments
  #will need to implement validations
  #get model and db up and running then work on controller and views
end
