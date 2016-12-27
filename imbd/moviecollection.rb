class MovieCollection

KEYS = %i[link title year country release genre time rating director actors]

  def initialize(file)
      @movies = CSV.read(file, col_sep: '|', write_headers: :true, headers: KEYS).map{ |movie| Movie.new(movie) }
      @genre_exstis = @movies.flat_map(&:genre).uniq
  end

  def all
    @movies
  end

  def sort_by(param)
    @movies.sort_by(&param)
  end

  def filter(params)
    movies = @movies.clone
    params.each_pair do |key, value|
      case value
      when Regexp
        movies.select! { |movie| movie.send(key) =~ value }
      when Range
        movies.select! { |movie| value.to_a.include?(movie.send(key)) }
      when Fixnum
        movies.select! { |movie| movie.send(key) == value}
      else
        movies.select! { |movie| movie.send(key).include?(value) }
      end
    end
    movies
  end

  def stats(param)
    @movies.flat_map(&param).sort.group_by(&:itself).map { |key, value| {key => value.size} }.reduce(:merge)
  end

  def genre_exstis?(genre)
    @genre_exstis.include?(genre)
  end

  def to_s
    "#{@title} (#{@year}), #{@genre} - #{@director}; #{@actors}"
  end

end
