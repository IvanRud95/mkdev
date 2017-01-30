module Imbd

  class MovieCollection

    include Enumerable

    class GenreNotExist < StandardError; end
    class ParametrNotExist < StandardError; end

    KEYS = %i[url title year country date genre duration rating director actors]

    def initialize(file)
      @movies = CSV.read(file, col_sep: '|', write_headers: :true, headers: KEYS).map { |movie| Movie.create(movie) }
      @genre_exist = @movies.flat_map(&:genre).uniq
    end

    def each
      @movies.each { |m| yield(m) }
    end

    def all
      @movies
    end

    def sort_by(param)
      check_params!(param)
      @movies.sort_by(&param)
    end

    def filter(params)
      check_params!(*params.keys)
      @movies.select { |movie| movie.matches?(params) }
    end

    def stats(param)
      check_params!(param)
      @movies.flat_map(&param).sort.group_by(&:itself).map { |key, value| {key => value.size} }.reduce(:merge)
    end

    def genre_exist?(genre)
      @genre_exist.include?(genre)
    end


    private

    def check_params!(*params)
      bad_fields = params.select { |field| !KEYS.include?(field) }
      raise ParametrNotExist, "Params: #{bad_fields} not exist" unless bad_fields.empty?
    end

    def to_s
      "#{@title} (#{@year}), #{@genre} - #{@director}; #{@actors}"
    end

  end

end
