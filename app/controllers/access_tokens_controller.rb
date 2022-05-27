class AccessTokensController < ApplicationController

  def show
    @access_token = current_user.token
  end

  def update
    if current_user.refresh_token
      redirect_to access_token_path, notice: "New token is created."
    else
      redirect_to access_token_path, alert: "Something went wrong when refresh new token."
    end
  end
end
