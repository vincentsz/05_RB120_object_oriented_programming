# Behold this incomplete class for constructing boxed banners.

# Modify this class so new will optionally let you specify a fixed banner width at the time the Banner object is created. 
# The message in the banner should be centered within the banner of that width. 
# Decide for yourself how you want to handle widths that are either too narrow or too wide.


class Banner
  require 'io/console'
  
  def initialize(message, width = 0)
    @message = message
    @text_size = message.size
    @max = IO.console.winsize[1] - 4
    @width = set_width(width)
  end

  def set_width(width)
    if width > max
      max
    elsif width - text_size >= 0
      width
    else
      text_size
    end
  end

  def to_s
    [horizontal_rule, empty_line, message_line, empty_line, horizontal_rule].join("\n")
  end

  private

  attr_reader :text_size, :width, :max

  def horizontal_rule
    "+-#{'-' * width}-+"
  end

  def empty_line
    "| #{' ' * width} |"
  end

  def message_line
    "| #{@message.center(width, ' ')} |"
  end
end

# Complete this class so that the test cases shown below work as intended. You are free to add any methods or instance variables you need. 
# However, do not make the implementation details public.

# You may assume that the input will always fit in your terminal window.

# Test Cases

banner = Banner.new('To boldly go where no one has gone before.')
puts banner
# +--------------------------------------------+
# |                                            |
# | To boldly go where no one has gone before. |
# |                                            |
# +--------------------------------------------+

banner = Banner.new('')
puts banner
# +--+
# |  |
# |  |
# |  |
# +--+

banner = Banner.new('To boldly go where no one has gone before.', 50)
puts banner
# +--------------------------------------------+
# |                                            |
# | To boldly go where no one has gone before. |
# |                                            |
# +--------------------------------------------+

banner = Banner.new('', 50)
puts banner
# +--+
# |  |
# |  |
# |  |
# +--+
banner = Banner.new('To boldly go where no one has gone before.', 1000)
puts banner
# +--------------------------------------------+
# |                                            |
# | To boldly go where no one has gone before. |
# |                                            |
# +--------------------------------------------+

banner = Banner.new('', 1000)
puts banner
# +--+
# |  |
# |  |
# |  |
# +--+