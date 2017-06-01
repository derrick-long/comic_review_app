class AssociateUsersAndComics < ActiveRecord::Migration[5.0]
  def change
    add_reference :comics, :user, index: true, null: false
  end
end
