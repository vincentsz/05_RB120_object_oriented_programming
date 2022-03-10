module Swimmable
  def enable_swimming
    @can_swim = true
  end
end

class Dog
  include Swimmable

  def swim
    "swimming!" if @can_swim
  end
end

teddy = Dog.new
p teddy.swim   


# What is output and why? What does this demonstrate about instance variables?
# nil is output. nil is returned by default when an if branch is not executed 
# and there is no else branch provided. The if conditional evaluates to a falsey value because @can_swim returns nil.
# @can_swim returns nil since it is never assigned to a value. This because its initialization is located in the enable_swimming method inside of the Swimmable module. 
# This instance method is never called on the object. By default an unassigned ivar will be initialised to reference nil, thus resulting in nil being output.