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

  it "Testing pay" do
    expect(subject.pay(10)).to be_a_kind_of(Numeric)
  end

  it "How mach?" do
    expect(subject.how_much?("Groundhog Day")).to be_a_kind_of(Numeric)
  end

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
