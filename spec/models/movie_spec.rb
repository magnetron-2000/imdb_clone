require 'rails_helper'

RSpec.describe Movie, type: :model do
  describe "model" do
    let(:movie) {create(:movie)}

    context "validations" do
      it "title is not presence" do
        movie.title = ''
        expect(movie).not_to be_valid
      end

      it "title is out of range" do
        movie.title = 'a' * 100
        expect(movie).not_to be_valid
      end

      it "text is not presence" do
        movie.text = ''
        expect(movie).not_to be_valid
      end

      it "text is out of range" do
        movie.text = 'a' * 1
        expect(movie).not_to be_valid
      end

      it "rating has not right data type" do
        movie.rating = 'd'
        expect(movie).not_to be_valid
      end

      it "rating is out of range" do
        movie.rating = 22
        expect(movie).not_to be_valid
      end

      it "category is not presence" do
        movie.category = ''
        expect(movie).not_to be_valid
      end

      it "category is not in array CATEGORIES" do
        movie.category = 'hello'
        expect(movie).not_to be_valid
      end
    end
  end
end
