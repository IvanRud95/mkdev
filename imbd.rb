if ARGV[0].nil?
  puts "A file is absent or incorrect entered. A file will be selected by default (movies.txt)"
  file = "movies.txt"
else
  File.exist?(ARGV[0]) ? file = ARGV[0] : exit()
end

list = File.open(file, 'r')

@movies = []

list.each_line do |line|
  @movies << line.split('|')
end

@movies.map! do |movie|
  { link: movie[0], title: movie[1],  year: movie[2], country: movie[3], release: movie[4], genre: movie[5], time: movie[6], rating: movie[7], director: movie[8], actors: movie[9] }
end

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
