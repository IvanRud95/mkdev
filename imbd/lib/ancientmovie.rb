class AncientMovie < Movie

  def price
    Money.new(100, 'USD')
  end

  def to_s
    "«#{@title} — old movie (#{@year} year)»"
  end

end
