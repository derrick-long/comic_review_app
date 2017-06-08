class AddGenreIdToComics < ActiveRecord::Migration[5.0]
  def change
    remove_column :comics, :genre, :string
    add_reference :comics, :genre, index: true
  end
end
