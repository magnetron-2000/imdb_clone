require 'rails_helper'

RSpec.describe "Movies", type: :request do
  describe "controller" do
    let(:movie) {create(:movie)}
    let(:movie_params) { { movie: {title:"hello", text: "hello", rating: 1, category: "horror"}}}
    context "GET /index" do
      it "returns http success" do
        get "/movies"
        expect(response).to have_http_status(:success)
      end
    end

    context "GET /new" do
      it "returns http success" do
        get "/movies/new"
        expect(response).to have_http_status(:success)
      end
    end

    context "GET /create" do
      it "returns http success" do
        post "/movies", params: movie_params
        expect(response).to have_http_status(302)
        expect(response).to redirect_to root_path
      end

      it "returns http error" do
        post "/movies", params: { movie: {title:"", text: "", rating: 1, category: ""}}
        expect(response).to have_http_status(200)
      end
    end

    context "GET /edit" do
      it "returns http success" do
        get "/movies/#{movie[:id]}/edit"
        expect(response).to have_http_status(:success)
      end
    end

    context "GET /update" do
      it "returns http success" do
        patch "/movies/#{movie[:id]}", params: movie_params
        expect(response).to have_http_status(302)
        expect(response).to redirect_to movie_path(movie[:id])
      end

      it "returns http error" do
        patch "/movies/#{movie[:id]}", params: { movie: {title:"", text: "", rating: 1, category: ""}}
        expect(response).to have_http_status(200)
      end
    end

    context "GET /destroy" do
      it "returns http success" do
        delete "/movies/#{movie[:id]}"
        expect(response).to have_http_status(302)
      end
    end
  end
end
