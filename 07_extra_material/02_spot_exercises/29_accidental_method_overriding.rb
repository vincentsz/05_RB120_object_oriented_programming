# When does accidental method overriding occur, and why? Give an example.

# Every class inherently subclasses from the `Object` class, 
# so the methods defined in this class are available to all classes.
# Through inheritance we can override these methods in the subclass, 
# which can lead to unexpected results and is therefore dangerous, 
# this is accidental method overwriting.
# Only `to_s` can be easily overriden without major side-effects.

# As an example we can override `Object#send`, which is normally used to call methods, 
# by sending in the method (represented as a symbol) as an argument.

class Mail
  attr_reader :type

  def initialize(type)
    @type = type
  end

  def send_type
    puts "Your #{@type} was sent!"
  end
end

email = Mail.new('e-mail')
p email.send :type

# In the code above we are trying to call the getter method `type`, through the `send` method, but an `ArgumentError` was raised instead.
# This is because we have overwritten `Object#send` with `Mail#send`. 
# An easy way to prevent this is to give `Mail#send` a more specific method name, like `Mail#send_type`.