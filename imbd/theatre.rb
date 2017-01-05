class Theatre < MovieCollection

  def show(time)
    {"Morning" => {year: 1900...1945}, "Afternoon" => {genre: ["Comedy", "Adventure"]}, "Evening" => {genre: ["Drama", "Horror"]}}.
    select do |key, value|
      @movie = filter(value).sort_by { |m| m.rating * rand }.last if key == time
    end

    start_time = Time.now
    end_time = start_time + @movie.duration * 60

    puts "«Now showing: #{@movie.title} #{start_time.strftime("%H:%M:%S")} - #{end_time.strftime("%H:%M:%S")}»"
  end

  def when?(movie_name)
    movie = filter(title: movie_name).sort_by { |m| m.rating * rand }.last
    if (1900...1945).include? movie.year
      puts "Morning"
    elsif movie.genre.include?("Comedy") || movie.genre.include?("Adventure")
      puts "Afternoon"
    elsif movie.genre.include?("Drama") || movie.genre.include?("Horror")
      puts "Evening"
    end
  end

end
