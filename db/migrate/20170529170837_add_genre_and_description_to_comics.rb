class AddGenreAndDescriptionToComics < ActiveRecord::Migration[5.0]
  def change
    add_column :comics, :genre, :string
    add_column :comics, :description, :text
  end
end
