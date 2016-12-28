class GenreNotExist < StandardError
end

class Movie

  attr_reader :url, :title, :year, :country, :date, :genre, :length, :rating, :director, :actors

  def initialize(row, collection = nil)
    @url,@title,@year,@country,@date,@genre,@length,@rating,@director,@actors = row[0..9]
    @genre, @actors = [@genre, @actors].map { |val| val.split(",") }
    @length, @year = [@length, @year].map { |val| val.to_i }
    @collection = collection unless collection.nil?
  end

  def matches?(params)
    params.reduce(true) do |res, (key, value)|
      res && matches_filter?(key, value)
    end
  end

  def matches_filter?(key, value)
    if self.send(key).is_a?(Array)
      self.send(key).any? { |v| v == value }
    else
      value === self.send(key)
    end
  end

  def has_genre?(genre)
    raise GenreNotExist, "Genre does not exist" unless @collection.genre_exist?(genre)
    @genre.include?(genre)
  end

  def to_s
      "#{@title} (#{@year}), #{@genre} - #{@director}; #{@actors}"
  end

end
