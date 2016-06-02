class UrlsController < ApplicationController
  def index
  end

  def new
  end

  def create
    url = Url.new(params[:long_url])
    url.short_url = url.retrieve_short_url
    if url.save
      @url = url
      redirect_to root_url
    else

    end
  end

  private
  def url_params
    params.require(:url).permit(:url)
  end

end
