require 'open-uri'
require 'rss'
require './essay.rb'

class Essays

  def initialize()
    @list = []
    puts 'essays obj init'
    load_essays()
  end

  def load_essays()
    uri = 'http://www.aaronsw.com/2002/feeds/pgessays.rss'
    open(uri) do |rss|
      feed = RSS::Parser.parse(rss)
      list_with_feed(feed)
    end
  end

  def list_with_feed(feed)
    feed.items.each do |item|
      essay = Essay.new(item)
      @list.push(essay)
      puts "item: #{item.title}"
      puts "link: #{item.link}"
    end
  end

end
