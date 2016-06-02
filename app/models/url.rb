class Url < ActiveRecord::Base

  validates :long_url, presence: true,
            format: {with: URI.regexp}
  validates :short_url, presence: true,
            uniqueness: true

  def self.retrieve_short_url(long_url)
    @long_url = self.find_by(long_url: long_url)
    if @long_url.nil?
      nil
    else
      @long_url.short_url
    end
  end
end
