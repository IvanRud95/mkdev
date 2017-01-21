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
      it { is_expected.to be_an(Array) }
      it { expect(subject.count).to eq 250 }
      it { is_expected.to all( be_an(Movie) ) }
      it { expect(subject.first.actors).to eq(["Tim Robbins", "Morgan Freeman", "Bob Gunton"]) }
    end

    describe '#sort_by' do

      subject { collection.sort_by(criteria) }

      context 'when title' do
        let(:criteria) { :title }
        it { is_expected.to be_an(Array) }
        it { expect(subject.count).to eq 250 }
        it { is_expected.to all( be_an(Movie) ) }
      end

      context 'when duration' do
        let(:criteria) { :duration }
        it { is_expected.to be_an(Array) }
        it { expect(subject.count).to eq 250 }
        it { is_expected.to all( be_an(Movie) ) }
      end

      context 'when year' do
        let(:criteria) { :year }
        it { is_expected.to be_an(Array) }
        it { expect(subject.count).to eq 250 }
        it { is_expected.to all( be_an(Movie) ) }
      end

    end

    describe '#stats' do

      subject { collection.stats(criteria) }

      context 'when genre' do
        let(:criteria) { :genre }
        it { is_expected.to be_an(Hash) }
        it { expect(subject.count).to eq 21 }
      end

      context 'when duration' do
        let(:criteria) { :duration }
        it { is_expected.to be_an(Hash) }
        it { expect(subject.count).to eq 99 }

      end

      context 'when actors' do
        let(:criteria) { :actors }
        it { is_expected.to be_an(Hash) }
        it { expect(subject.count).to eq 581 }
      end

    end

    describe '#filter' do

      subject { collection.filter(criteria) }

      context 'when filed not exist' do
        let(:criteria) { { director1: "James Cameron" } }
        it { expect { subject }.to raise_error(MovieCollection::ParametrNotExist) }
      end

      context 'when director' do
        let(:criteria) { { director: "James Cameron" } }
        it { is_expected.to all have_attributes(director: 'James Cameron') }
      end

      context 'when year' do
        let(:criteria) { { year: 1940..2000 } }
        it { is_expected.to all have_attributes(year: 1940..2000) }
      end

      context 'when director' do
        let(:criteria) { { director: "James Cameron" } }
        it { is_expected.to all have_attributes(director: 'James Cameron') }
      end

      context 'when title' do
        let(:criteria) { { title: /ermi/i } }
        it { is_expected.to all have_attributes(title: /ermi/i) }
      end

      context 'when country' do
        let(:criteria) { { country: 'USA' } }
        it { is_expected.to all have_attributes(country: 'USA') }
      end

      context 'when date' do
        let(:criteria) { { date: 1984 } }
        it { is_expected.to all have_attributes(date: 1984) }
      end

      context 'when genre' do
        let(:criteria) { { genre: "Action" } }
        it { is_expected.to all have_attributes(genre: include("Action")) }
      end

      context 'when duration' do
        let(:criteria) { { duration: /\d{3}/ } }
        it { is_expected.to all have_attributes(duration: /\d{3}/) }
      end

      context 'when rating' do
        let(:criteria) { { rating: /\d{1}.\d{1}/ } }
        it { is_expected.to all have_attributes(rating: /\d{1}.\d{1}/) }
      end

      context 'when actors' do
        let(:criteria) { { actors: "James Cameron" } }
        it { is_expected.to all have_attributes(actors: include("James Cameron")) }
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
