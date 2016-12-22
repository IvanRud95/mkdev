
class Movie

  def initialize
    @movies = MovieCollection.new('movies.txt')
  end

  def all
    @movies.all
  end

  def first
    self.first
  end

  def actors
    self.send(:actors)
  end

end

