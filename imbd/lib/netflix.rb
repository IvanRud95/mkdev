module Imbd

  class Netflix < MovieCollection

    def initialize(file)
      super
      @balance = Money.new(0, "USD")
    end

    extend CashBox

    class NotEnoughMoney < StandardError; end
    class FilmNotFound < StandardError; end
    class NegativeAmountMoneys < StandardError; end

    def show(param)

      raise FilmNotFound, "Film Not Found" if filter(title: param).empty?
      movie = filter(title: param).sort_by { |movie| movie.rating * rand }.last
      raise NotEnoughMoney, "Not enough money. This movie cost #{movie.price.format}. Your balance #{@balance}" if @balance < movie.price

      start_time = Time.now
      end_time = start_time + movie.duration * 60

      @balance -= movie.price

      puts "«Now showing: #{movie.title} #{start_time.strftime("%H:%M:%S")} - #{end_time.strftime("%H:%M:%S")}»"

    end

    def pay(amount)
      raise NegativeAmountMoneys, "Negative Amount Moneys" if amount < 0
      @balance += Money.new(amount*100, "USD")
      self.class.put_money(amount)
    end

    def how_much?(movie_name)
      filter(title: movie_name).last.price.format
    end

    def balance
      @balance
    end

  end

end
