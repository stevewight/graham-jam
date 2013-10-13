require 'nokogiri'

class Cleaner

  def initialize(raw)
    @raw = raw
  end

  def remove_html
    html_doc = Nokogiri::HTML(@raw)
    puts '~~~~~~~~~~~~~~~~~~~~~~~'
  end

end
