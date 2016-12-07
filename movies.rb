movie = ARGV[0]

bad_movie = "Titanic"
good_movies = ["Matrix", "Undeniable 2"]

if good_movies.include?(movie)
  puts "#{movie} is a good movie"
elsif movie == bad_movie
  puts "Titanic is a bad movie"
else
  puts "Haven't seen #{movie} yet"
end
