require 'csv'
require 'date'
require_relative 'moviecollection'
require_relative 'movie'

collection = MovieCollection.new('movies.txt')

#p collection.all
#p collection.sort_by(:length)
p collection.filter(genre: "Action", title: /termi/i, director: "James Cameron", year: 1980..2015)
#p collection.stats(:genre)
#p collection.all.first.actors






# m = ["http://imdb.com/title/tt0076759/?ref_=chttp_tt_19", "Star Wars: Episode IV - A New Hope", "1977", "USA", "1977-05-25", "Action,Adventure,Fantasy", "121 min", "8.7", "George Lucas", "Mark Hamill,Harrison Ford,Carrie Fisher"]
# movie = Movie.new(m, collection)

# begin
#   puts movie.has_genre?('Action1')
# rescue GenreNotExist => e
#   puts e.message
# end
