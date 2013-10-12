class Essay

  attr_accessor :clean_text
  attr_accessor :title
  attr_accessor :link

  def initialize(item)
    @title = item.title
    @link = item.link
  end

end
