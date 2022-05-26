require 'rails_helper'

RSpec.describe "RedirectionsControllerSpec", type: :controller do
  describe RedirectionsController do
    it "is 302 status" do
      user = FactoryBot.create(:user)

      url = user.urls.create(original_url: "https://google.com/")

      get :show, params: { token: url.token }

      expect( response.status ).to eq(302)
    end
  end
end
