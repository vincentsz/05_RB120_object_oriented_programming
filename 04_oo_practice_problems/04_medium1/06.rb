# If we have these two methods in the Computer class:

class Computer
  attr_reader :template

  def template=(temp)
    @template = temp.upcase
  end

  def create_template
    @template = "template 14231"
  end

  def show_template
    template
  end
end

my_temp = Computer.new
my_temp.create_template
my_temp.show_template

# and

class Computer
  attr_reader :template

  def template=(temp)
    @template = temp.upcase
    return "will this come back?"
  end

  def create_template
    self.template = "template 14231"
  end

  def show_template
    template
  end
end

my_temp = Computer.new
my_temp.create_template
my_temp.show_template

# What is the difference in the way the code works?
# Same results, tasks are accomplished differently. 
# difference between create template_methods, first will assign instance variable @template directly, 
# second it will assign it by calling the setter method, second way is safer, 
# since there could be additional code added like a custom setter method, which would be skipped in the first ex.
# In the second create temp method self is necesarry to avoid creating a local variable template

# No difference in second beacuse they both call the show_template getter method, self is not required in the second example