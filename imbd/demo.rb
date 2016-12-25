require 'csv'
require 'date'
require_relative 'moviecollection'
require_relative 'movie'

collection = MovieCollection.new('movies.txt')

#puts movies.all
#puts movies.sort_by(:length)
#puts movies.filter(genre: "Comedy", country: "USA", director: "Charles Chaplin")
#p movies.stats(:genre)
#puts movies.all.first.actors



m = ["http://imdb.com/title/tt0076759/?ref_=chttp_tt_19", "Star Wars: Episode IV - A New Hope", "1977", "USA", "1977-05-25", "Action,Adventure,Fantasy", "121 min", "8.7", "George Lucas", "Mark Hamill,Harrison Ford,Carrie Fisher"]

movie = Movie.new(m, collection)

begin
  puts movie.has_genre?('Comedy1')
rescue
  puts "Not a ganre"
end
