module Imbd

  class NewMovie < Movie

    def price
      Money.new(500, 'USD')
    end

    def to_s
      "#{@title} — new movie, release #{Time.now.strftime('%Y').to_i - @year } years ago"
    end

  end

end
