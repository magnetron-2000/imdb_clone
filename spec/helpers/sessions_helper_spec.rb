require 'rails_helper'

# Specs in this file have access to a helper object that includes
# the SessionsHelper. For example:
#
# describe SessionsHelper do
#   describe "string concat" do
#     it "concats two strings with spaces" do
#       expect(helper.concat_strings("this","that")).to eq("this that")
#     end
#   end
# end
RSpec.describe SessionsHelper, type: :helper do
  describe "helper" do
    let!(:user) {create(:user)}
    it "log_in" do
      log_in(user)
      expect(session[:user_id]).to eq(user.id)
    end

    it "current_user return @current_user" do
      log_in(user)
      current_user
      expect(@current_user).to eq(user)
    end

    it "log_out" do
      log_in(user)
      current_user
      log_out
      expect(@current_user).to eq(nil)
    end

    it "authorized" do
      authorized
      expect(response).to have_http_status(302)
    end
  end
end
