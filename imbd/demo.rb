require 'csv'
require 'date'
require_relative 'moviecollection'
require_relative 'movie'

collection = MovieCollection.new('movies.txt')

# p collection.all
# p collection.sort_by(:length)
# p collection.stats(:genre)
# p collection.all.first.actors
#p collection.filter(director: "James Cameron", year: 1940..2000, genre: "Action", actors: "Arnold Schwarzenegger", title: /ermi/i)

# begin
#   puts movie.has_genre?('Action1')
# rescue GenreNotExist => e
#   puts e.message
# end
