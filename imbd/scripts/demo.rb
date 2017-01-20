require 'csv'
require 'date'
require_relative '../lib/moviecollection'
require_relative '../lib/movie'
require_relative '../lib/netflix'
require_relative '../lib/theatre'
require_relative '../lib/ancientmovie'
require_relative '../lib/classicmovie'
require_relative '../lib/modernmovie'
require_relative '../lib/newmovie'

# theatre = Theatre.new("lib/movies.txt")
# p theatre.when?("The Wages of Fear")

# moviecollection = MovieCollection.new("lib/movies.txt")
# p moviecollection.filter(year: 1940..2000).count

#p moviecollection.sort_by(:duration).last.duration

#p moviecollection.stats(:actors).first

#netflix = Netflix.new("lib/movies.txt")
#netflix.pay(10)
# begin
#   netflix.show(title: /ter/i)
# rescue Netflix::NotEnoughMoney => e
#   puts e.message
# end
#p netflix.money
#netflix.how_much?("Groundhog Day")
#netflix.show(title: "Groundhog Days")

# @collection = MovieCollection.new("lib/movies.txt")
# m = ["http://imdb.com/title/tt1130884/?ref_=chttp_tt_192","Shutter Island","2010","USA","2010-02-19","Mystery,Thriller","138 min","8.1","Martin Scorsese","Leonardo DiCaprio,Emily Mortimer,Mark Ruffalo"]
# am = NewMovie.new(m, @collection)
# begin
#   puts am.has_genre?('Mystery')
# rescue Movie::GenreNotExist => e
#   puts e.message
# end

#p MovieCollection.new("lib/movies.txt").filter(title: "Groundhog Day")
