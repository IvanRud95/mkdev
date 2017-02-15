module Imbd

  class Theatre < MovieCollection

    include CashBox

    class PeriodNotFound < StandardError; end

    PERIODS = {
                       8..12 => {year: 1900...1945},
                       12..17 => {genre: ["Comedy", "Adventure"]},
                       17..23 => {genre: ["Drama", "Horror"]}
                     }

    PRICE = {
                       PERIODS.keys[0] => 3,
                       PERIODS.keys[1] => 5,
                       PERIODS.keys[2] => 10
                     }

    def show(time)
      raise PeriodNotFound, "Films during the #{time.hour} is not" if PERIODS.detect { |range, filter| range === time.hour }.nil?
      movie = filter(PERIODS.detect { |range, filter| filter }.last).select { |movie| movie.rating * rand }.last

      start_time = Time.now
      end_time = start_time + movie.duration * 60

      puts "«Now showing: #{movie.title} #{start_time.strftime("%H:%M:%S")} - #{end_time.strftime("%H:%M:%S")}»"
    end

    def when?(movie_name)
      movie = filter(title: movie_name).last
      PERIODS.select { |key, val| filter(val).include? movie }.map(&:first)
    end

    def buy_ticket(movie)
      raise "The cinema closed" unless PERIODS.detect { |hours, price| hours.include?(Time.now.hour) }
      _hours, price = PERIODS.detect { |hours, price| hours.include?(Time.now.hour) }
      put_money(price)
      puts "You bought ticket on #{movie}"
    end

  end

end
