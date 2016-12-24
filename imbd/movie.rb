class Movie

 attr_reader :url, :title, :year, :country, :date, :genre, :length, :rating, :director, :actors

  def initialize(row)
    @url,@title,@year,@country,@date,@genre,@length,@rating,@director,@actors = row[0..9]
    @length = @length.to_i
  end

  def has_genre?(genre)
    if @genre.include?(genre)
      true
    else
      if MovieCollection.all_exist_ganres.include?(genre)
        false
      else
        raise
      end
    end
  end

  def to_s
      "#{@title} (#{@year}), #{@genre} - #{@director}; #{@actors}"
  end

end

