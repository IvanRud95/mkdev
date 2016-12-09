if ARGV[0].nil?
  puts "A file is not entered or incorrect entered. A file will be selected by default (movies.txt)"
  file = "movies.txt"
else
  File.exist?(ARGV[0]) ? file = ARGV[0] : exit()
end

KEYS = [:link, :title, :year, :country, :release, :genre, :time, :rating, :director, :actors]

@movies = File.read(file).each_line.map { |movie| movie.split('|') }.map { |movie| KEYS.zip(movie).to_h }

def top_five_movies
  @movies.sort_by { |time| time[:time].to_i }.reverse.first(5).each do |movie|
    puts "#{movie[:title]} (#{movie[:release]}; #{movie[:genre]}) - #{movie[:time]}"
  end
end

def ten_comedies
  @movies.select { |genre| genre[:genre].include?("Comedy") }.sort_by { |release| release[:release] }.first(10).each do |movie|
    puts "#{movie[:title]} (#{movie[:release]}; #{movie[:genre]}) - #{movie[:time]}"
  end
end

def list_directors
  puts @movies.map { |directors| directors[:director] }.uniq.sort_by { |director| director.split(' ')[-1] }
end

def amount_movies_produced_outside_usa
  puts @movies.map { |country| country[:country] }.delete_if { |country| country == "USA" }.count
end

top_five_movies
ten_comedies
list_directors
amount_movies_produced_outside_usa
