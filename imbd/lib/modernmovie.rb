class ModernMovie < Movie

  def price
    Money.new(300, 'USD')
  end

  def to_s
    "#{@title} — modern movie: actors #{@actors.join(', ')}"
  end

end
