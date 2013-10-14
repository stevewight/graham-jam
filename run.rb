require './essays'
require './cleaner'

zero_count = 0
one_count = 0
more_count = 0

essays = Essays.new()

essays.list.each do |essay|
  raw = essay.load_raw()
  cleaner = Cleaner.new(raw)
  elements = cleaner.find_core_element
  puts '#########################'
  puts 'Loading...'
  puts essay.title  
  puts "<p> count: #{elements.length}"

  if elements.length > 1
    more_count += 1
  elsif elements.length == 1
    one_count += 1
  elsif elements.length == 0
    zero_count += 1
  end
end

puts "Essays with 0 <p>: #{zero_count}"
puts "Essays with 1 <p>: #{one_count}"
puts "Essays with 2+ <p>: #{more_count}"
