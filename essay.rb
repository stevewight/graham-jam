require 'net/http'

class Essay

  attr_accessor :title
  attr_accessor :link
  attr_accessor :sentences

  def initialize(item)
    @title = item.title
    @link = item.link
    puts "Title: #{@title}"
    puts "Link: #{@link}"
    load()
  end

  def load()
    uri = URI(@link)
    raw = Net::HTTP.get(uri)
    analyze(raw)
  end

  def analyze(raw)
    to_sentences(raw)
  end

  def to_sentences(raw)
    @sentences = raw.gsub(/\s+/, '').strip.split(/\.|\?|!/)
    puts "sentences count: #{@sentences.length}"
    @sentences.each do |sentence|
      puts "sentence: #{sentence}"
      puts "***********************"
    end
  end
  
end
