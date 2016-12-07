if ARGV[0].nil?
  puts "A file is absent or incorrect entered. A file will be selected by default (movies.txt)"
  file = "movies.txt"
else
  File.exist?(ARGV[0]) ? file = ARGV[0] : exit()
end

list = File.open(file, 'r')

movies = []

list.each_line do |line|
  movies << line.split('|')
end

movies.each do |movie|
  if movie[1].include?("Max")
    rating = "*" * (movie[7].to_f * 10 - 80)
    puts "#{movie[1]} #{rating} "
  end
end
