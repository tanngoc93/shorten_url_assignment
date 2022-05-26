module Api
  class BaseController < ApplicationController
    protect_from_forgery with: :null_session

    skip_before_action :authenticate_user!
    before_action :authenticate_api!

    def meta_attributes(collection, extra_meta = {})
      {
        current_page: collection.try(:current_page),
        next_page: collection.try(:next_page),
        prev_page: collection.try(:prev_page),
        total_pages: collection.try(:total_pages)
      }.merge(extra_meta)
    end

    protected

    def authenticate_api!
      authenticate_or_request_with_http_token do |token, _|
        User.find_by(token: token)
      end
    end

    def current_user
      @current_user ||= authenticate_api!
    end
  end
end