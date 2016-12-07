if ARGV[0].nil? || File.exist?(ARGV[0]) == false
  puts "A file is absent or incorrect entered. A file will be selected by default (movies.txt)"
  ARGV[0] = "movies.txt"
else
end

list = File.open(ARGV[0], 'r')

movies = []

list.each_line do |line|
  movies << line.split('|')
end

movies.each do |movie|
  if movie[1].include?("Max")
    rating = movie[7].split('.')
    rating = "*" * (rating[0].to_i  * 10+ rating[1].to_i - 80)
    puts "#{movie[1]} #{rating} "
  else
  end
end
