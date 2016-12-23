require 'csv'
require 'date'
require_relative 'moviecollection'
require_relative 'movie'

movies = MovieCollection.new('movies.txt')
#puts movies.all
#puts movies.sort_by(:length)
#puts movies.filter(genre: "Comedy", country: "USA", director: "Charles Chaplin")
#puts movies.stats(:genre)
#puts movies.all.first.actors
begin
  puts movies.has_genre?('Tragedy')
rescue
  puts "Not a ganre"
end
