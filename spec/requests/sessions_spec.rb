require 'rails_helper'
include SessionsHelper

RSpec.describe "Sessions", type: :request do
  describe "controller" do
    let!(:user) {create(:user)}
    let(:params) { {session: {password: "MyString", email: "MyString@mail.com"}}}

    context "get /login" do
      it "returns http success" do
        get "/login"
        expect(response).to have_http_status(:success)
      end
    end

    context "post /login" do
      it "return http success" do
        post "/login", params: params
        expect(response).to have_http_status(302)
      end

      it " return http error" do
        post "/login", params: {session: {email: "s@mail.com", password: "s"}}
        expect(response).to have_http_status(200)
      end
    end

    context "delete /logout" do
      it "return http success" do
        post "/login", params: params
        delete "/logout"
        expect(response).to have_http_status(302)
      end
    end
  end
end
