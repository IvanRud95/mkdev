require 'rspec'
require 'csv'
require 'date'
require_relative '../moviecollection'
require_relative '../movie'
require_relative '../netflix'
require_relative '../theatre'
require_relative '../ancientmovie'
require_relative '../classicmovie'
require_relative '../modernmovie'
require_relative '../newmovie'

describe MovieCollection do

    subject { described_class.new("movies.txt") }

    it "All collection" do
      expect(subject.all).to be_an(Array)
    end

    it "Sorting by duration" do
      expect(subject.sort_by(:duration)).to be_an(Array)
    end

    it "Statistic by genre" do
      expect(subject.stats(:genre)).to be_an(Hash)
    end

    it "First actors" do
      expect(subject.all.first.actors).to be_an(Array)
    end

    it "Testing filters" do
      expect(subject.filter(director: "James Cameron", year: 1940..2000, genre: "Action", actors: "Arnold Schwarzenegger", title: /ermi/i)).to be_an(Array)
    end

end

describe Theatre do

  subject { described_class.new("movies.txt") }

  it "Testing show" do
    expect(subject.show("Morning")).to be_an(NilClass)
  end

  it "Testing when" do
    expect(subject.when?('Gone with the Wind')).to be_an(NilClass)
  end

end

describe Netflix do

  subject { described_class.new("movies.txt") }

  it "Testing pay" do
    expect(subject.pay(10)).to be_an(Fixnum)
  end

  it "How mach?" do
    expect(subject.how_much?("The Terminator")).to be_an(Movie)
  end

  # it "" do
  #   expect(subject.***.to
  # end

end
