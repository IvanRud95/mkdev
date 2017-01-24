class AncientMovie < Movie

  def price
    1
  end

  def to_s
    "«#{@title} — old movie (#{@year} year)»"
  end

end
