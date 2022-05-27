module Api
  class UrlsController < BaseController

    def index
      urls = current_user.urls.page(params[:page] || 1).per(params[:per] || 10)

      render json: {
        urls: urls,
        meta_attributes: meta_attributes(urls)
      }, status: 200
    end

    def create
      url = current_user.urls.new(url_params)

      if url.save
        render json: url, status: 201
      else
        render json: { message: uls.errors.full_messages.to_sentence }, status: 400
      end
    end

    private

    def url_params
      params.permit(:original_url)
    end
  end
end