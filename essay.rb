require 'open-uri'
require './cleaner.rb'

class Essay
  attr_accessor :title, :link  
 
  def initialize(item)
    @title = item.title
    @link = item.link
    puts 'initialized essay'
  end
  
  def load_raw()
    uri = URI(@link)
    begin
      @raw = open(uri)
    rescue
      @raw = 'nothing good'
    end
  end

end
