# frozen_string_literal: true

require 'rails_helper'

describe MoviesService do
  describe 'instance methods' do
    describe '#top_20_rated', :vcr do
      it 'returns the top 20 rated movies' do
        VCR.use_cassette('top_20_rated_movies', re_record_interval: 7.days) do
          top_20 = MoviesService.new.top_20_rated

          expect(top_20).to be_a Hash
          expect(top_20[:results]).to be_an Array
          expect(top_20[:results].length).to eq(20)

          number1 = top_20[:results].first

          expect(number1).to have_key :title
          expect(number1[:title]).to be_a String

          expect(number1).to have_key :vote_average
          expect(number1[:vote_average]).to be_a Float
        end
      end
    end
  end
end
