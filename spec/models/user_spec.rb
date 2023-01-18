require 'rails_helper'

RSpec.describe User, type: :model do
  describe "model" do
    let(:user) {create(:user)}
    context "validations" do
      it "name is not presence" do
        user.name = ''
        expect(user).not_to be_valid
      end

      it "name is too long" do
        user.name = 'a' * 51
        expect(user).not_to be_valid
      end

      it "email is not presence" do
        user.email = ''
        expect(user).not_to be_valid
      end

      it "email is too long" do
        user.email = 'a' * 300 + "@mail.com"
        expect(user).not_to be_valid
      end

      it "email is wrong" do
        user.email = 'a'
        expect(user).not_to be_valid
      end

      it "email exist" do
        user.email = 'a@mail.com'
        user2 = User.create(name:"newname", email:"A@mail.com", password_digest:"newstring")
        expect(user2).not_to be_valid
      end

      it "password is not presence" do
        user2 = User.create(name:"newname", email:"A@mail.com", password_digest:"")
        expect(user2).not_to be_valid
      end

      it "password is too short" do
        user2 = User.create(name:"newname", email:"A@mail.com", password_digest:"a")
        expect(user2).not_to be_valid
      end
    end
  end
end
