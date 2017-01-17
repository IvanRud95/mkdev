class ClassicMovie < Movie

  def price
    1.5
  end

  def amount_movies
    @collection.filter(director: @director).size
  end

  def to_s
    "#{@title} — classic movie, director: #{@director} (#{amount_movies} more of his films in the list)"
  end

end
