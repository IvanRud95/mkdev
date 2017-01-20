class Movie

  attr_reader :url, :title, :year, :country, :date, :genre, :duration, :rating, :director, :actors

  def initialize(row, collection = nil)
    @url,@title,@year,@country,@date,@genre,@duration,@rating,@director,@actors = row[0..9]
    @genre, @actors = [@genre, @actors].map { |val| val.split(",") }
    @duration, @year = [@duration, @year].map { |val| val.to_i }
    @rating = @rating.to_f
    @collection = collection
  end

  def self.create(movie)
    case movie[2].to_i
    when 1900...1945
      AncientMovie.new(movie)
    when 1945...1968
      ClassicMovie.new(movie)
    when 1968...2000
      ModernMovie.new(movie)
    else
      NewMovie.new(movie)
    end
  end

  def matches?(params)
    params.reduce(true) do |res, (key, value)|
      res && matches_filter?(key, value)
    end
  end

  def price; self.price end

  def has_genre?(genre)
    @genre.include?(genre)
  end


  private

  def matches_filter?(key, value)
    if self.send(key).is_a?(Array)
      if value.is_a?(Array)
        self.send(key).any? { |v| value.include?(v) }
      else
        self.send(key).any? { |v| v == value }
      end
    else
      value === self.send(key)
    end
  end

  def to_s
    "#{@title} (#{@year}), #{@genre} - #{@director}; #{@actors}"
  end

end
