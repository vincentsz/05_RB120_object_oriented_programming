class A
  module B; end
end

class C < A
  p B == A::B
end
----
class A
  def get_c; C; end
end

class B < A
  module C; end
end

B.new.get_c
# NameError: uninitialized constant A::C