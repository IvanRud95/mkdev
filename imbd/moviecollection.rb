class MovieCollection

  attr_reader :all_exist_ganres

KEYS = %i[link title year country release genre time rating director actors]

  def initialize(file)
      @movies = CSV.read(file, col_sep: '|', write_headers: :true, headers: KEYS).map{ |movie| Movie.new(movie) }
      @@all_exist_ganres = @movies.map { |movie| movie.send(:genre).split(",") }.flatten.uniq
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
      movies.select! { |movie| movie.send(key).include?(value) }
    end
     movies
  end

  def stats(param)
    @movies.map { |movie| movie.send(param).split(",") }.flatten.sort.group_by(&:itself).map { |key, value| {key => value.size} }.reduce(:merge)
  end

  def self.all_exist_ganres
    @@all_exist_ganres
  end

  def to_s
    "#{@title} (#{@year}), #{@genre} - #{@director}; #{@actors}"
  end

end
