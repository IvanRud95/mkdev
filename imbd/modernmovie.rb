class ModernMovie < Movie

  def price
    3
  end

  def to_s
    "#{@title} — modern movie: actors #{@actors.join(', ')}"
  end

end
