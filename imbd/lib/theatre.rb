class Theatre < MovieCollection

  def initialize(file)
    super
    @cash = 0
  end

  include CashBox

  class PeriodNotFound < StandardError; end

  PERIOD = {
                     "Morning" => {year: 1900...1945},
                     "Afternoon" => {genre: ["Comedy", "Adventure"]},
                     "Evening" => {genre: ["Drama", "Horror"]}
                   }

  def show(time)
    raise PeriodNotFound, "Films during the #{time} is not" if PERIOD[time].nil?
    movie = filter(PERIOD[time]).select { |movie| movie.rating * rand }.last

    start_time = Time.now
    end_time = start_time + movie.duration * 60

    puts "«Now showing: #{movie.title} #{start_time.strftime("%H:%M:%S")} - #{end_time.strftime("%H:%M:%S")}»"
  end

  def when?(movie_name)
    movie = filter(title: movie_name).last
    PERIOD.select { |key, value| filter(value).include? movie }.map(&:first)
  end

  def buy_ticket(movie)
    price = case Time.now.hour
    when 8...12
      300
    when 12...17
      500
    when 17...23
      1000
    else
      raise "The cinema closed"
    end
    money(price)
    puts "You bought ticket on #{movie}"
  end

end

