class UrlsController < ApplicationController
  before_action :set_url, only: [:show, :edit, :update, :destroy]

  def index
    @urls = current_user.urls.order(created_at: :desc)
  end

  def create
    @url = current_user.urls.new(url_params)

    if @url.save
      redirect_to url_path @url
    else
      redirect_to root_url, alert: @url.errors.full_messages.to_sentence
    end
  end

  def show; end

  def edit; end
  
  def update
    if @url.update(url_params)
      redirect_to url_path
    else
      render :edit
    end
  end

  def destroy
    if @url.destroy
      redirect_to urls_path
    else
      redirect_to root_url
    end
  end

  private

  def url_params
    params.require(:url).permit(:original_url)
  end

  def set_url
    @url = Url.find_by(id: params[:id])
  end
end
