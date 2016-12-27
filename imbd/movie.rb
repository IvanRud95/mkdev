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

  def has_genre?(genre)
    raise GenreNotExist, "Genre does not exist" unless @collection.genre_exstis?(genre)
    @genre.include?(genre)
  end

  def to_s
      "#{@title} (#{@year}), #{@genre} - #{@director}; #{@actors}"
  end

end

