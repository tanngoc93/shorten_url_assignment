class PageController < ApplicationController
  def index
    @url = Url.new
  end
end
