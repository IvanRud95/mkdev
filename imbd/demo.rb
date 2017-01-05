require 'csv'
require 'date'
require_relative 'moviecollection'
require_relative 'movie'
require_relative 'netflix'
require_relative 'theatre'
require_relative 'ancientmovie'
require_relative 'classicmovie'
require_relative 'modernmovie'
require_relative 'newmovie'


# netflix = Netflix.new("movies.txt")
# begin
#   netflix.show(title: /ter/i)
# rescue Netflix::NotEnoughMoney => e
#   puts e.message
# end


#@collection = MovieCollection.new("movies.txt")
# m = ["http://imdb.com/title/tt1130884/?ref_=chttp_tt_192","Shutter Island","2010","USA","2010-02-19","Mystery,Thriller","138 min","8.1","Martin Scorsese","Leonardo DiCaprio,Emily Mortimer,Mark Ruffalo"]
# am = NewMovie.new(m, @collection)
# begin
#   puts movie.has_genre?('Action1')
# rescue Movie::GenreNotExist => e
#   puts e.message
# end
