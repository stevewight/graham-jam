require 'open-uri'
require 'rss'
require 'essay'

class Essays
  URI = URI('http://www.aaronsw.com/2002/feeds/pgessays.rss')
  attr_accessor :list

  def initialize()
    @list = []
    load_essays()
  end

  def load_essays()
    open(URI) do |rss|
      feed = RSS::Parser.parse(rss)
      list_with_feed(feed)
    end
  end

  def list_with_feed(feed)
    feed.items.each do |item|
      essay = Essay.new(item)
      puts '--------------------'
      @list.push(essay)
    end
  end  

end
