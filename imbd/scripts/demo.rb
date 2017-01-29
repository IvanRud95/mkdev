require 'csv'
require 'date'
require 'money'
require_relative '../lib/moviecollection'
require_relative '../lib/movie'
require_relative '../lib/cashbox'
require_relative '../lib/netflix'
require_relative '../lib/theatre'
require_relative '../lib/ancientmovie'
require_relative '../lib/classicmovie'
require_relative '../lib/modernmovie'
require_relative '../lib/newmovie'

#Это работает

theatre = Theatre.new("lib/movies.txt")
theatre.buy_ticket("Terminator")
theatre.buy_ticket("Terminator 2")
p theatre.cash
theatre.take("Bank")
theatre.buy_ticket("Terminator")
p theatre.cash
begin
  theatre.take("Bank1")
rescue Theatre::Robbery => e
  puts e.message
end

#Это не работает

# netflix = Netflix.new("lib/movies.txt")
# p netflix.how_much?("Fight Club")
# netflix.pay(20)
# netflix.show("Fight Club")
























# p Netflix.cash

# netflix.pay(10)

# netflix.pay(10)

# p Netflix.cash

# Netflix.take("Bank")

# begin
#   Netflix.take("Bank1")
# rescue => e
#   puts e.message
# end








# netflix = Netflix.new("lib/movies.txt")

# Netflix.pay(10)

# Netflix.pay(10)

# netflix1 = Netflix.new("lib/movies.txt")

# Netflix.pay(10)

# p Netflix.cash


# Netflix.take("Bank")

# #netflix.buy_ticket("Terminator")

# p Netflix.cash

# begin
#   Netflix.take("Bank1")
# rescue Netflix::Robbery => e
#   puts e.message
# end















# theatre = Theatre.new("lib/movies.txt")
# p theatre.when?("The Wages of Fear")

#moviecollection = MovieCollection.new("lib/movies.txt")

#p moviecollection.reject { |m| m.year < 2009 }

#p MovieCollection.new("lib/movies.txt").select { |m| m.year < 2009 }

# begin
#   p moviecollection.filter(director1: "James Cameron", director: "James Cameron")
# rescue MovieCollection::ParametrNotExist => e
#   puts e.message
# end

# begin
#   p moviecollection.sort_by(:director1)
# rescue MovieCollection::ParametrNotExist => e
#   puts e.message
# end

# begin
#   p moviecollection.stats(:director1)
# rescue MovieCollection::ParametrNotExist => e
#   puts e.message
# end

#p moviecollection.filter(director: "James Cameron")
#.map { |m| m.duration }
#m = moviecollection.sort_by(:duration).map { |m| m.duration }

#p moviecollection.filter(rating: 8.9...9.5).map {|m| m.rating}

#p moviecollection.filter(year: 1940...1945)

#p moviecollection.stats(:duration)

# netflix = Netflix.new("lib/movies.txt")
# netflix.pay(10)
# begin
#   netflix.show(title: /ter/i)
# rescue Netflix::NotEnoughMoney => e
#   puts e.message
# end
#p netflix.money
#p netflix.how_much?("Groundhog Day")
#netflix.show(title: "Groundhog Days")

# @collection = MovieCollection.new("lib/movies.txt")
# m = ["http://imdb.com/title/tt1130884/?ref_=chttp_tt_192","Shutter Island","2010","USA","2010-02-19","Mystery,Thriller","138 min","8.1","Martin Scorsese","Leonardo DiCaprio,Emily Mortimer,Mark Ruffalo"]
# am = NewMovie.new(m, @collection)
# am.has_field?('Mystery')
# begin
#   puts am.has_genre?('Mystery')
# rescue Movie::GenreNotExist => e
#   puts e.message
# end

#p MovieCollection.new("lib/movies.txt").filter(title: "Groundhog Day")


