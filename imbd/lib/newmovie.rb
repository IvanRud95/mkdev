class NewMovie < Movie

  def price
    5
  end

  def to_s
    "#{@title} — new movie, release #{Time.now.strftime('%Y').to_i - @year } years ago"
  end

end
