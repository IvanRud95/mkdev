def  imbd
  if File.exist?(ARGV[0])
    list = File.open(ARGV[0], 'r')
  else
    puts "A file is absent. A file will be selected by default (movies.txt)"
    list = File.open('movies.txt', 'r')
  end

  movies = []

  list.each_line do |line|
    movies << line.split('|')
  end

  movies.each do |movie|
    if movie[1].include?("Max")
      rating = movie[7].split('.')
      rating = "*" * rating[1].to_i
      puts "#{movie[1]} #{rating} "
    else
    end
  end
end

begin
  imbd
rescue
  puts "A file with movies not loaded"
end
