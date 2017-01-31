module Imbd

  module CashBox

    I18n.enforce_available_locales = false

    class Robbery < StandardError; end

    def count
      @cash
    end

    def cash
      @cash.format( symbol: @cash.currency.to_s + ' ')
    end

    def money(amount)
      @cash ||= Money.new(0, "USD")
      @cash += Money.new(amount*100, "USD")
    end

    def collection
      @cash = Money.new(0, "USD")
    end

    def take(who)
      raise Robbery, "Called the police" unless who == "Bank"
      collection
      puts "Проведена инкассация. Наличных в кассе #{@cash.format}"
    end

  end

end
