class MovieCollection

  class GenreNotExist < StandardError; end
  class ParametrNotExist < StandardError; end

  KEYS = %i[url title year country date genre duration rating director actors]

  def initialize(file)
    @movies = CSV.read(file, col_sep: '|', write_headers: :true, headers: KEYS).map { |movie| Movie.create(movie) }
    @genre_exist = @movies.flat_map(&:genre).uniq
  end

  def all
    @movies
  end

  def sort_by(param)
    params_exist?(param)
    @movies.sort_by(&param)
  end

  def filter(params)
    params_exist?(params)
    @movies.select { |movie| movie.matches?(params) }
  end

  def stats(param)
    params_exist?(param)
    @movies.flat_map(&param).sort.group_by(&:itself).map { |key, value| {key => value.size} }.reduce(:merge)
  end

  def genre_exist?(genre)
    @genre_exist.include?(genre)
  end


  private

  def params_exist?(params)
    bad_fields = if params.respond_to?(:keys)
      params.keys.select { |key| !KEYS.include?(key) }
    elsif !KEYS.include?(params)
     params
    end
    raise ParametrNotExist, "Params: #{bad_fields} not exist" unless bad_fields.nil? || bad_fields.empty?
  end

  def to_s
    "#{@title} (#{@year}), #{@genre} - #{@director}; #{@actors}"
  end

end
