# In the last question we had a module called Speed which contained a go_fast method. 
# We included this module in the Car class as shown below.
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


# When we called the go_fast method from an instance of the Car class (as shown below) 
# you might have noticed that the string printed when we go fast includes the name of the type of vehicle we are using. 
# How is this done?

# >> small_car = Car.new
# >> small_car.go_fast
# I am a Car and going super fast!

# small_car is a Car object, when we call go_fast on it it will look for a go_fast method in method lookup chain which is the following: [Car, Speed, Object, Kernel, BasicObject].
# It will find the corresponding method in the Speed module. Inside the go_fast method self is called which refers to the calling object 
#(self used within a class inside of an instance method refers to the calling object). 
# Since the calling object is a Car object, when we call #class on it it returns its class.
# since it is interpolateed, to_s is called on it.