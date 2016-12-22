class MovieCollection

KEYS = %i[link title year country release genre time rating director actors]

  def initialize(file)
    @movies = CSV.read(file, col_sep: '|').map { |movie| OpenStruct.new(KEYS.zip(movie).to_h) }
  end

  def all
    @movies
  end

  def sort_by(param)
    @movies.sort_by(&param).first(3)
  end

  def filter(params)
    movies = @movies.clone
    params.each_pair do |key, value|
      movies.select! { |movie| movie.send(key).include?(value) }
    end
     movies
  end

  def stats(param)
    @movies.map { |movie| movie.send(param).split(",") }.flatten.sort.group_by(&:itself).map { |key, value| {key => value.size} }.reduce(:merge)
  end

end
