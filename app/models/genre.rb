class Genre < ApplicationRecord
has_many :comics
GENRES = ["Fantasy", "Science Fiction", "Superhero", "Horror", "Reality Based", "Comedy", "Noir", "Foregin"]

validates :genre_name, presence: true, inclusion: { in: GENRES}
end
