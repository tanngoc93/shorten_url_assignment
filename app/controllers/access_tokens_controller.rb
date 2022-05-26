class AccessTokensController < ApplicationController

	def show
		@access_token = current_user.token
	end
end
