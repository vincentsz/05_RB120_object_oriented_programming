NoScore
####
case score
when NoScore
  "No idea about #{term}..."
when 0...0.5
  "#{term} is not fun."
when 0.5
  "#{term} seems to be ok..."
else
  "#{term} rocks!"
end

# recall how case statements work. 
# The value of score will be compared with each value in the when clauses using the === operator. 
# In case of the first when clause, the comparison is NoScore === score, and since the left-hand side is a class, 
# its implementation boils down to checking whether score is_a? NoScore. 
# This yields false when score has the value NoScore, as it is not an instance of the NoScore class. 
# As a result, we end up with the value of the else clause.