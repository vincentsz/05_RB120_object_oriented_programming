p "self from the top level is #{self}"

module MyModule
  p "self from a module definition is #{self}"

  def self.show_self_from_module_method
    "self from a module method is #{self}."
  end

  def show_self_from_instance_method_in_module
    "self from an instance method in a module is #{self}."
  end
end

class MyClass
  include MyModule
  p "self from a class definition is #{self}"

  def self.show_self_from_class
    "self from a class method is #{self}."
  end

  def show_self_from_instance_method
    "self from an instance method is #{self}."
  end
end

my_object = MyClass.new
p my_object.show_self_from_instance_method
p MyClass.show_self_from_class
p my_object.show_self_from_instance_method_in_module
p MyModule.show_self_from_module_method