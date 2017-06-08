class AddGenresTable < ActiveRecord::Migration[5.0]
  def change
    create_table :genres do |t|
      t.string :genre_name
    end
  end
end
