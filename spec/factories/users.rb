FactoryBot.define do
  email = Faker::Internet.email
  password = Faker::Internet.password

  factory :user do
    email { email }
    password { password }
    password_confirmation { password }
  end
end
