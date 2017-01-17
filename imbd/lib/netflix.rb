class Netflix < MovieCollection

  def initialize(file)
    super
    @money = 0
  end

  class NotEnoughMoney < StandardError; end

  def show(params)

    movie = filter(params).sort_by { |movie| movie.rating * rand }.last
    raise NotEnoughMoney, "Not enough money. This movie cost #{movie.price}. Your balance #{@money}" if @money.nil? || @money < movie.price

    start_time = Time.now
    end_time = start_time + movie.duration * 60

    @money -= movie.price

    puts "«Now showing: #{movie.title} #{start_time.strftime("%H:%M:%S")} - #{end_time.strftime("%H:%M:%S")}»"

  end

  def pay(money)
    @money =+ money
  end

  def how_much?(movie_name)
    filter(title: movie_name).select { |movie| movie.rating * rand }.last.price
  end

end
