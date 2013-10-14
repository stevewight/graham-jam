require 'nokogiri'

class Cleaner

  def initialize(raw)
    @raw = raw
  end

  def remove_html
    html_doc = Nokogiri::HTML(@raw)
    @clean = html_doc.xpath("//text()").to_s
  end

  def find_core_element
    html = Nokogiri::HTML(@raw)
    @elements = html.css('p')
  end

end
