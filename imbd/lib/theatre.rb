class Theatre < MovieCollection

PERIOD = {"Morning" => {year: 1900...1945}, "Afternoon" => {genre: ["Comedy", "Adventure"]}, "Evening" => {genre: ["Drama", "Horror"]}}

  def show(time)
    PERIOD.select do |key, value|
      @movie = filter(value).sort_by { |movie| movie.rating * rand }.last if key == time
    end

    start_time = Time.now
    end_time = start_time + @movie.duration * 60

    puts "«Now showing: #{@movie.title} #{start_time.strftime("%H:%M:%S")} - #{end_time.strftime("%H:%M:%S")}»"
  end

  def when?(movie_name)
    movie = filter(title: movie_name).select { |movie| movie.rating * rand }.last
    PERIOD.detect do |key, value|
      puts key if filter(value).include? movie
    end
  end

end
