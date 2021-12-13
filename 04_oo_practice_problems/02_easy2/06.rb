# If I have the following class:

class Television
  def self.manufacturer
    # method logic
  end

  def model
    # method logic
  end
end

# Which one of these is a class method (if any) and how do you know? How would you call a class method?

# self.manufacturer is the class method, we know this because it is preceded by self at the method definition
# class methods are called directly on the clas, as such : Television.manufacturer