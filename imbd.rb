require 'csv'
require 'ostruct'
require 'date'

if ARGV[0].nil?
  puts "A file is not entered or incorrect entered. A file will be selected by default (movies.txt)"
  file = "movies.txt"
else
  File.exist?(ARGV[0]) ? file = ARGV[0] : exit()
end

KEYS = %i[link title year country release genre time rating director actors]

@movies = CSV.read(file, col_sep: '|' ).map { |movie| OpenStruct.new(KEYS.zip(movie).to_h) }

def top_five_movies
  @movies.sort_by { |movie| movie.time.to_i }.reverse.first(5).each do |movie|
    puts "#{movie.title} (#{movie.release}; #{movie.genre}) - #{movie.time}"
  end
end

def ten_comedies
  @movies.select { |movie| movie.genre.include?("Comedy") }.sort_by(&:release).first(10).each do |movie|
    puts "#{movie.title} (#{movie.release}; #{movie.genre}) - #{movie.time}"
  end
end

def list_directors
  puts @movies.map(&:director).uniq.sort_by { |director| director.split(' ')[-1] }
end

def amount_movies_produced_outside_usa
  puts @movies.map(&:country).delete_if { |country| country == "USA" }.count
end

def monthly_statistics
 puts @movies.map(&:release).
   reject { |date| date.count('-').zero? }.
   map { |date| Date.strptime(date, '%Y-%m') }.
   sort_by(&:mon).
   group_by { |date| date.strftime('%B') }.
   map { |month, amount| "#{month} - #{amount.size}" }
end

# top_five_movies
# ten_comedies
# list_directors
# amount_movies_produced_outside_usa
monthly_statistics
