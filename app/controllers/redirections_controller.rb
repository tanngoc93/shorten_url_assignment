class RedirectionsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:show]
  before_action :set_url, only: [:show]

  def show
    if @url && @url.open_url
      redirect_to @url.original_url, allow_other_host: true
    else
      redirect_to root_url
    end
  end

  private

  def set_url
    @url = Url.find_by(token: params[:token])
  end
end
