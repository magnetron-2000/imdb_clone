FactoryBot.define do
  factory :user do
    name { "MyString" }
    email { "MyString@mail.com" }
    password { "MyString" }
    admin { false }
  end
end
