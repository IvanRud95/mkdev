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

    subject(:collection) { described_class.new("lib/movies.txt") }

    describe '#all' do
      subject { collection.all }
      it { expect(subject).to be_an(Array) }
      it { expect(subject.count).to eq 250 }
      it { expect(subject).to all( be_an(Movie) ) }
      it { expect(subject.first.actors).to eq(["Tim Robbins", "Morgan Freeman", "Bob Gunton"]) }
    end

    describe '#sort_by' do

      subject { collection.sort_by(criteria) }

      context 'when title' do
        let(:criteria) { :title }
        it { is_expected.to be_an(Array) }
      end

      context 'when duration' do
        let(:criteria) { :duration }
        it { expect(subject.first.duration).to eq 67 }
      end

      context 'when year' do
        let(:criteria) { :year }
        it { expect(subject).to all(be_an(Movie)) }
      end

    end

    describe '#stats' do

      subject { collection.stats(criteria) }

      context 'when genre' do
        let(:criteria) { :genre }
        it { is_expected.to be_an(Hash) }
      end

      context 'when duration' do
        let(:criteria) { :duration }
        it { expect(subject.first).to eq [67, 1] }
        it { expect(subject.count).to eq 99 }
      end

      context 'when actors' do
        let(:criteria) { :actors }
        it { expect(subject.count).to eq 581 }
        it { expect(subject.first).to eq ["Aamir Khan", 1] }
      end

    end

    describe '#filter' do

      context 'when all filters' do
        it { expect(subject.filter(director: "James Cameron", year: 1940..2000, genre: "Action", actors: "Arnold Schwarzenegger", title: /ermi/i)).to be_an(Array) }
        it { expect(subject.filter(director: "James Cameron", year: 1940..2000, genre: "Action", actors: "Arnold Schwarzenegger", title: /ermi/i).count).to eq 2 }
        it { expect(subject.filter(director: "James Cameron", year: 1940..2000, genre: "Action", actors: "Arnold Schwarzenegger", title: /ermi/i)).to all( be_an(Movie) ) }
      end

      context 'when year' do
        it { expect(subject.filter(year: 1940..2000).count).to eq 164 }
      end

    end

    describe '#genre_exist?' do

      context "when genre exist" do
        it {expect(subject.genre_exist?('Action')).to be_truthy }
      end

      context "when genre not exist" do
        it {expect(subject.genre_exist?('Not exist genre')).to be_falsey }
      end

    end

end
