module CashBox

  I18n.enforce_available_locales = false

  class Robbery < StandardError; end

  def cash
    @cash.format( symbol: @cash.currency.to_s + ' ')
  end

  def money(amount)
    @cash += Money.new(amount, "USD")
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
