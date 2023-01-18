require 'rails_helper'

RSpec.describe "Users", type: :request do
  describe "controller" do
    let(:user) {create(:user)}
    let(:params) {{user: {name:'Mystring', email:"mynewstring@mail.com", password:"mystring", password_confirmation: 'mystring'}}}
    let(:wrong_params) {{user: {name:'', email:"", password:"", password_confirmation: ''}}}
    context "GET /show" do
      it "returns http success" do
        get "/users/#{user.id}"
        expect(response).to have_http_status(:success)
      end
    end

    context "GET /new" do
      it "returns http success" do
        get "/users/new"
        expect(response).to have_http_status(:success)
      end
    end

    context "GET /create" do
      it "returns http success" do
        post "/users", params: params
        expect(response).to have_http_status(302)
        expect(response).to redirect_to user_path(User.last)
      end

      it "return http error" do
        post "/users", params: wrong_params
        expect(response).to have_http_status(:success)
      end
    end

    context "GET /update" do
      it "returns http success" do
        patch "/users/#{user.id}", params: params
        expect(response).to have_http_status(302)
        expect(response).to redirect_to user_path(user.id)
      end

      it "return http error" do
        patch "/users/#{user.id}", params: wrong_params
        expect(response).to have_http_status(:success)
      end
    end

    context "GET /edit" do
      it "returns http success" do
        get "/users/#{user.id}/edit"
        expect(response).to have_http_status(:success)
      end
    end

    context "GET /destroy" do
      it "returns http success" do
        delete "/users/#{user.id}"
        expect(response).to have_http_status(302)
        expect(response).to redirect_to root_path
      end
    end
  end
end
