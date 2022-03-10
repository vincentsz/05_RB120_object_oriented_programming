module A
  module B; end
  module C
    module D
    p B == A::B
    end
  end
end

module A
  module C
    module D
    p  Module.nesting #== [A::C::D, A::C, A] 
    #=> known as the cref, The cref holds a reference to the cbase, which, among other things, is used for constant and class variable lookup.
    end
  end
end

module A
  module B; end
end

module A::C
  p Module.nesting
end
# NameError: uninitialized constant A::C::B
# outer namespaces not added, Module.namespacing would have to add A, which it does not, it only adds A::C


