number = 42

case number
when 1          then 'first'
when 10, 20, 30 then 'second'
when 40..49     then 'third'
end


# What methods does this `case` statement use to determine which `when` clause is executed?

# The case method calls the === method on the clause in the when statement. 
# Essentially it asks the question; If the clause is a group, does the argument belong to it?
# Which === method is used exactly will depend on the type of the class it's called on.
# On line 4 this will be Integer#===, on line 5 this will be Integer#=== as well and on line this will be the Range#=== method.
# The when clause on line 6 is executed, since 42 is within the range of 40..49.