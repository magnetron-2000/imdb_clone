require 'rails_helper'

RSpec.describe "Users", type: :request do
  describe "controller" do
    let(:user) {create(:user)}
    let(:params) {{user: {name:'Mystring', email:"mynewstring@mail.com", password:"mystring", password_confirmation: 'mystring'}}}
    let(:wrong_params) {{user: {name:'', email:"", password:"", password_confirmation: ''}}}
    context "get /show" do
      it "returns http success" do
        get "/users/#{user.id}"
        expect(response).to have_http_status(:success)
      end
    end

    context "get /new" do
      it "returns http success" do
        get "/users/new"
        expect(response).to have_http_status(:success)
      end
    end

    context "post /create" do
      it "returns http success" do
        post "/users", params: params
        expect(response).to have_http_status(302)
        expect(response).to redirect_to user_url(User.last)
      end

      it "return http error" do
        post "/users", params: wrong_params
        expect(response).to have_http_status(:success)
      end
    end

    context "patch /update" do
      it "returns http success" do
        patch "/users/#{user.id}", params: params
        expect(response).to have_http_status(302)
        expect(response).to redirect_to user_url(user.id)
      end

      it "return http error" do
        patch "/users/#{user.id}", params: wrong_params
        expect(response).to have_http_status(:success)
      end
    end

    context "get /edit" do
      it "returns http success" do
        get "/users/#{user.id}/edit"
        expect(response).to have_http_status(:success)
      end
    end

    context "delete /destroy" do
      it "returns http success" do
        delete "/users/#{user.id}"
        expect(response).to have_http_status(302)
        expect(response).to redirect_to root_url
      end
    end
  end
end
