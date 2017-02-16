module Imbd

  module CashBox

    I18n.enforce_available_locales = false

    class Robbery < StandardError; end

    def cash
      @cash
    end

    def put_money(amount)
      @cash ||= Money.new(0, "USD")
      @cash += Money.new(amount*100, "USD")
    end

    def take(who)
      raise Robbery, "Called the police" unless who == "Bank"
      @cash = Money.new(0, "USD")
      puts "Проведена инкассация. Наличных в кассе #{@cash.format}"
    end

  end

end
