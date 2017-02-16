module Imbd

  class ClassicMovie < Movie

    def price
      Money.new(150, 'USD')
    end

    def amount_movies
      @collection.filter(director: @director).size
    end

    def to_s
      "#{@title} — classic movie, director: #{@director} (#{amount_movies} more of his films in the list)"
    end

  end

end
