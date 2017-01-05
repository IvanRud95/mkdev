class Netflix < MovieCollection

  class NotEnoughMoney < StandardError; end

  def show(params)

    movie = filter(params).sort_by { |m| m.rating * rand }.last
    raise NotEnoughMoney, "Not enough money" if @money.nil? || @money < movie.price
    start_time = Time.now
    end_time = start_time + movie.duration * 60

    puts "«Now showing: #{movie.title} #{start_time.strftime("%H:%M:%S")} - #{end_time.strftime("%H:%M:%S")}» #{movie.class}"

    @money -= movie.price

  end

  def pay(money)
    @money = money
  end

  def how_much?(movie_name)
    filter(title: movie_name).sort_by { |m| m.rating * rand }.last
  end

end
