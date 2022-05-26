require 'rails_helper'

RSpec.describe Url, type: :model do
  describe Url do
    it { should validate_presence_of(:original_url) }
    it { should belong_to(:user) }
  end

  describe Url do
    it "click_analytics should increase 1 for each url open" do
      user = FactoryBot.create(:user)
      url = user.urls.create(original_url: Faker::Internet.url)

      expect( url.click_analytics ).to eq(0)

      url.open_url

      expect( url.click_analytics ).to eq(1)
    end
  end  
end
