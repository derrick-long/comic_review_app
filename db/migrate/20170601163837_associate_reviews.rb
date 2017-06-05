class AssociateReviews < ActiveRecord::Migration[5.0]
  def change
    add_reference :reviews, :user, index: true, null: false
    add_reference :reviews, :comic, index: true, null: false
  end
end
