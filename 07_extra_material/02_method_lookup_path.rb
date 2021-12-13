module Foo1
end

module Foo2
end

module Bar
include Foo1
  
  class Fooey
    include Foo2
  end
end

p Bar::Fooey.ancestors
# Fooey > Foo2 > Bar > Foo1 > Object > Kernel > BasicObject
