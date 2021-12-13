# self called from within an instance method in a class will reference the object itself, in this case small_car, which is an instance of of the Car class. 
#Since we call self.class via string interpolation, (so to_s is automatically called)
#a string representation of the class to which my_car belongs, in this case Car, wille be returned