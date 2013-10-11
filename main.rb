#grahamJam main
require 'net/http'
require 'open-uri'
require 'rss'

def run
  puts 'grahamJam is running'
  total_lines = 0

  #load all essays
  feed_uri = URI('http://www.aaronsw.com/2002/feeds/pgessays.rss')
  raw = Net::HTTP.get(feed_uri)

  open(feed_uri) do |rss|
    feed = RSS::Parser.parse(rss)
    puts "Title: #{feed.channel.title}"
    feed.items.each do |item|
      puts "-------------------"
      puts "Item: #{item.title}"
      puts "Link: #{item.link}"

      uri = URI(item.link)
      essay = Net::HTTP.get(uri)
      line_count = 0
      essay.each { |line| line_count += 1 }
      puts "Count of lines #{line_count}"

      puts "------------------"
    end
  end

end

run
