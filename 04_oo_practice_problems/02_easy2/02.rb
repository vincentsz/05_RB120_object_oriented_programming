# We have an Oracle class and a RoadTrip class that inherits from the Oracle class.

class Oracle
  def predict_the_future
    "You will " + choices.sample
  end

  def choices
    ["eat a nice lunch", "take a nap soon", "stay at work late"]
  end
end

class RoadTrip < Oracle
  def choices
    ["visit Vegas", "fly to Fiji", "romp in Rome"]
  end
end

# What is the result of the following:

trip = RoadTrip.new
trip.predict_the_future

# => You will <some trip>.
# Since we are calling the instance method predict_the_future of an object from the RoadTrip class, 
# every time Ruby tries to resolve a method name, it will look for a corresponding method in the class you are calling first, 
# before moving up the inheritance hierarchy. 