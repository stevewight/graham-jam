require 'nokogiri'

class Cleaner

  def initialize(raw)
    @raw = raw
  end

  def remove_html
    html_doc = Nokogiri::HTML(@raw)
    #para = html_doc.css('p')
    clean_text = html_doc.xpath("//text()").to_s
    puts clean_text
    puts '~~~~~~~~~~~~~~~~~~~~~~~'
  end

  def find_core_element
    html = Nokogiri::HTML(@raw)
    elements = html.css('p')
    puts "<p> Count: #{elements.length}"
  end

end
