require 'csv'
require 'date'
require_relative 'moviecollection'
require_relative 'movie'
# # # #puts movies.all
# # # #puts movies.sort_by(:length)
# # # #puts movies.filter(genre: "Comedy", country: "USA", director: "Charles Chaplin")
# # # #puts movies.stats(:genre)
# # # #puts movies.all.first.actors

movies = MovieCollection.new('movies.txt')

#p movies.all_exist_genres

m = ["http://imdb.com/title/tt0076759/?ref_=chttp_tt_19", "Star Wars: Episode IV - A New Hope", "1977", "USA", "1977-05-25", "Action,Adventure,Fantasy", "121 min", "8.7", "George Lucas", "Mark Hamill,Harrison Ford,Carrie Fisher"]
# g =  ["Crime", "Drama", "Action", "Biography", "History", "Western", "Adventure", "Fantasy", "Romance", "Mystery", "Sci-Fi", "Thriller", "Family", "Comedy", "War", "Animation", "Horror", "Music", "Film-Noir", "Musical", "Sport"]

movie = Movie.new(m, movies)

begin
  puts movie.has_genre?('Action')
rescue
  puts "Not a ganre"
end
