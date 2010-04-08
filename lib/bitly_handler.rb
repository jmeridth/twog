
class BitlyHandler
  def initialize(bitly)
    @bitly = bitly
  end

  def shorten(link)
    @bitly.shorten(link).short_url
  end
end
