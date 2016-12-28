class MovieCollection

KEYS = %i[link title year country release genre time rating director actors]

  def initialize(file)
      @movies = CSV.read(file, col_sep: '|', write_headers: :true, headers: KEYS).map{ |movie| Movie.new(movie) }
      @genre_exist = @movies.flat_map(&:genre).uniq
  end

  def all
    @movies
  end

  def sort_by(param)
    @movies.sort_by(&param)
  end

  def filter(params)
    @movies.select { |movie| movie.matches?(params) }
  end

  def stats(param)
    @movies.flat_map(&param).sort.group_by(&:itself).map { |key, value| {key => value.size} }.reduce(:merge)
  end

  def genre_exist?(genre)
    @genre_exist.include?(genre)
  end

  private

  def to_s
    "#{@title} (#{@year}), #{@genre} - #{@director}; #{@actors}"
  end

end
