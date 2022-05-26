require 'rails_helper'

RSpec.describe User, type: :model do
  describe User do
    it { should validate_presence_of(:email) }
    it { should have_many(:urls) }
  end

  describe User do
    it "is invalid with a duplicate email" do
      password = Faker::Internet.password

      user = FactoryBot.create(:user)
      duplicate_user = User.create(email: user.email, password: password, password_confirmation: password)

      duplicate_user.valid?
      
      expect( duplicate_user.errors[:email] ).to include("has already been taken")
    end
  end  
end
