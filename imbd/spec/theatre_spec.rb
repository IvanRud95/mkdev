require 'rspec'
require 'csv'
require 'date'
require 'money'
require_relative '../lib/cashbox'
require_relative '../lib/moviecollection'
require_relative '../lib/movie'
require_relative '../lib/netflix'
require_relative '../lib/theatre'
require_relative '../lib/ancientmovie'
require_relative '../lib/classicmovie'
require_relative '../lib/modernmovie'
require_relative '../lib/newmovie'

describe Imbd::Theatre do

  subject { described_class.new("lib/movies.txt") }

  describe '#show' do
    it "Testing show" do
      expect{subject.show(Time.now)}.to output(/^«[a-z].*[a-z]\s\d{2}:\d{2}:\d{2} - \d{2}:\d{2}:\d{2}»/i).to_stdout
    end
    it "Testing not exist period" do
      expect{subject.show(Time.local(2017,"jan",1,5,15,1))}.to raise_error(Imbd::Theatre::PeriodNotFound)
    end

  end

  describe '#when?' do
    it "Testing when" do
      expect(subject.when?('Gone with the Wind')).to eq(["Morning", "Evening"])
    end
  end

end
