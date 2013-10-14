require 'open-uri'
require './cleaner.rb'

class Essay

  def initialize(item)
    @title = item.title
    @link = item.link
    puts 'initialized essay'
    loadRaw()
  end
  
  def loadRaw()
    uri = URI(@link)
    begin
      raw = open(uri)
    rescue
      raw = 'nothing good'
    end
    clean(raw)
  end

  def clean(raw)
    cleaner = Cleaner.new(raw)
    #cleaner.remove_html
    cleaner.find_core_element
  end

end
