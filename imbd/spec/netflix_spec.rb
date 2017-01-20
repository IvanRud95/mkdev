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

describe Netflix do

  subject { described_class.new("lib/movies.txt") }

  describe '#pay' do

    it 'increases Netflix\'s amount of money' do
      expect { subject.pay(10) }.to change(subject, :money).by(10)
    end

    it 'fails on negative amounts' do
      expect { subject.pay(-5) }.to raise_error(Netflix::NegativeAmountMoneys)
    end
  end

  describe '#how_much?' do
    it "How mach?" do
      expect(subject.how_much?("Groundhog Day")).to eq(3)
    end
  end

  describe '#show' do
    it "When not enough money" do
      subject.pay(1)
      expect{subject.show(title: /ter/i)}.to raise_error(Netflix::NotEnoughMoney)
    end

    it "When enough money" do
      subject.pay(10)
      expect{subject.show(title: "Groundhog Day")}.to output(/^«Now showing: Groundhog Day \d{2}:\d{2}:\d{2} - \d{2}:\d{2}:\d{2}»/i).to_stdout
      expect(subject.money).to eq(7)
    end

    it "Film not found" do
      subject.pay(10)
      expect{subject.show(title: "Groundhog Days")}.to raise_error(Netflix::FilmNotFound)
    end
  end

end
