require 'rspec'
require 'csv'
require 'date'
require_relative '../lib/moviecollection'
require_relative '../lib/movie'
require_relative '../lib/netflix'
require_relative '../lib/theatre'
require_relative '../lib/ancientmovie'
require_relative '../lib/classicmovie'
require_relative '../lib/modernmovie'
require_relative '../lib/newmovie'

describe MovieCollection do

    subject { described_class.new("../lib/movies.txt") }

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
