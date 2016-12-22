require 'csv'
require 'ostruct'
require 'date'
require_relative 'moviecollection'
require_relative 'movie'

#movies = MovieCollection.new('movies.txt')
#p movies.all
#p movies.sort_by(:year)
#p movies.filter(genre: "Comedy", country: "USA", director: "Charles Chaplin")
#p movies.stats(:genre)

#p movies.has_genre?('Comedy')

#выдать любое поле, в разумном формате, например, movies.all.first.actors — это будет массив актёров в первом фильме списка;

movies = Movie.new

p movies.all.first.actors
