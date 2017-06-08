# This file should contain all the record creation needed to seed the database with its defaul)

GENRES = ["Fantasy", "Science Fiction", "Superhero", "Horror", "Reality Based", "Comedy", "Noir", "Foregin"]

GENRES.each do |genre|
  Genre.find_or_create_by(genre_name: genre)
end
