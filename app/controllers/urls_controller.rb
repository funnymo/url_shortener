class UrlsController < ApplicationController
  def index
    @urls = Url.all
  end

  def new
    @url = Url.new
  end

  def create
    @url = Url.new(url_params)
    if @url.save
      redirect_to urls_path
    else
      @errors = "Error!"
    end
    redirect_to urls_path
  end

  private
  def url_params
    params.permit(:long_url).merge(short_url: SecureRandom.base64[0..8])
  end
end
