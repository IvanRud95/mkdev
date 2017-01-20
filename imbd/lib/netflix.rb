class Netflix < MovieCollection

  attr_reader :money

  def initialize(file)
    super
    @money = 0
  end

  class NotEnoughMoney < StandardError; end
  class FilmNotFound < StandardError; end
  class NegativeAmountMoneys < StandardError; end

  def show(params)

    raise FilmNotFound, "Film Not Found" if filter(params).empty?
    movie = filter(params).sort_by { |movie| movie.rating * rand }.last
    raise NotEnoughMoney, "Not enough money. This movie cost #{movie.price}. Your balance #{@money}" if @money < movie.price

    start_time = Time.now
    end_time = start_time + movie.duration * 60

    @money -= movie.price

    puts "«Now showing: #{movie.title} #{start_time.strftime("%H:%M:%S")} - #{end_time.strftime("%H:%M:%S")}»"

  end

  def pay(money)
    raise NegativeAmountMoneys, "Negative Amount Moneys" if money < 0
    @money =+ money
  end

  def how_much?(movie_name)
    filter(title: movie_name).last.price
  end

end
