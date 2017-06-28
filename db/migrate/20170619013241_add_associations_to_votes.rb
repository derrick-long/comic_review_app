class AddAssociationsToVotes < ActiveRecord::Migration[5.0]
  def change
    add_reference :votes, :user, index: true, null: false
    add_reference :votes, :review, index: true, null: false
  end
end
