class MeMyselfAndI
  self

  def self.me
    self
  end

  def myself
    self
  end
end

i = MeMyselfAndI.new


# What does each `self` refer to in the above code snippet
# self inside of a class, outside of an instance method, represents the class itself. 
# self inside of a class, inside of an instance methid, refers to the calling object.
# So self on line 2, 4 and 5 refers to the MeMyselfAndI class, while self on line 9 refers to the calling object i.