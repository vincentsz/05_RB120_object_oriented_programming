# Write a class that implements a miniature stack-and-register-based programming language that has the following commands:

#     n Place a value n in the "register". Do not modify the stack.
#     PUSH Push the register value on to the stack. Leave the value in the register.
#     ADD Pops a value from the stack and adds it to the register value, storing the result in the register.
#     SUB Pops a value from the stack and subtracts it from the register value, storing the result in the register.
#     MULT Pops a value from the stack and multiplies it by the register value, storing the result in the register.
#     DIV Pops a value from the stack and divides it into the register value, storing the integer result in the register.
#     MOD Pops a value from the stack and divides it into the register value, storing the integer remainder of the division in the register.
#     POP Remove the topmost item from the stack and place in register
#     PRINT Print the register value

# All operations are integer operations (which is only important with DIV and MOD).

# Programs will be supplied to your language method via a string passed in as an argument. 
# Your program should produce an error if an unexpected item is present in the string, 
# or if a required stack value is not on the stack when it should be (the stack is empty). 
# In all error cases, no further processing should be performed on the program.

# You should initialize the register to 0.

# Examples:
class StackError < StandardError
   puts "stack error!"
end

class Minilang
  def initialize(command)
    @stack = []
    @register = 0
    @commands = split_command(command)
  end

  def split_command(command)
    command.split(' ')
  end

  def verify(comm)
    p '-----'
    p comm
    p @register
    p @stack
  end

  def eval
    # p @commands
    begin
      @commands.each do |comm|
        case comm
        when 'PUSH'
          @stack << @register.clone
          # verify(comm)
        when 'ADD'
          @register = @register + @stack.pop
          # verify(comm)
        when 'SUB'
          @register = @register - @stack.pop
          # verify(comm)
        when 'MULT'
          @register = @register * @stack.pop
          # verify(comm)
        when 'DIV'
          @register = @register / @stack.pop
          # verify(comm)
        when 'MOD'
          @register = @register % @stack.pop
          # verify(comm)
        when 'POP'
          @register = @stack.pop
          # verify(comm)
        when 'PRINT'
          puts @register
          # verify(comm)
        when comm.to_i.to_s
          @register = comm.to_i
          # verify(comm)
        else 
          raise StackError, 'oops'
        end
      end
    rescue StackError => e
      return e.message
    end
  end
end

Minilang.new('PRINT').eval
# # 0

Minilang.new('5 PUSH 3 MULT PRINT').eval
# 15

Minilang.new('5 PRINT PUSH 3 PRINT ADD PRINT').eval
# # 5
# # 3
# # 8

Minilang.new('5 PUSH 10 PRINT POP PRINT').eval
# # 10
# # 5

Minilang.new('5 PUSH POP POP PRINT').eval
# # Empty stack!

# Minilang.new('3 PUSH PUSH 7 DIV MULT PRINT ').eval
# # 6

# Minilang.new('4 PUSH PUSH 7 MOD MULT PRINT ').eval
# # 12

# Minilang.new('-3 PUSH 5 XSUB PRINT').eval
# # Invalid token: XSUB

# Minilang.new('-3 PUSH 5 SUB PRINT').eval
# # 8

# Minilang.new('6 PUSH').eval
# # (nothing printed; no PRINT commands)