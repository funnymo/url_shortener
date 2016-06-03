class Url < ActiveRecord::Base

  validates :long_url, presence: true,
            format: {with: URI.regexp}
  validates :short_url, presence: true

  def self.retrieve_short_url(long_url)
    ret = self.find_by(long_url: long_url)
    return ret.short_url unless ret.nil?
    nil
    # if @long_url.nil?
    #   nil
    # else
    #   @long_url.short_url
    # end
  end
end
