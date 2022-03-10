# You may remember our Minilang language from back in the RB101-RB109 Medium exercises. 
# We return to that language now, but this time we'll be using OOP. 
# If you need a refresher, refer back to that exercise.

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

# Programs will be supplied to your language method via a string passed in as an argument. Your program should produce an error if an unexpected item is present in the string, or if a required stack value is not on the stack when it should be (the stack is empty). In all error cases, no further processing should be performed on the program.

# You should initialize the register to 0.
class MinilangError < StandardError ;end
class EmptyStackError < MinilangError ;end
class InvalidTokenError < MinilangError; end


class Minilang
  require 'set'

  COMMANDS = Set.new %w(push add sub mult div mod pop print)

  def initialize(commands)
    @commands = commands
    @register = 0
    @stack = []
  end

  def eval
    @commands.split(' ').each { |command| eval_token(command) }
    puts 'I got here'
    rescue MinilangError => error
      puts error.message
      puts 'I got here as well! '
  end

  def eval_token(command)
    if COMMANDS.include?(command.downcase)
      send(command.downcase)
    elsif command.to_i.to_s == command
      @register = command.to_i
    else
      raise InvalidTokenError, "Invalid token: #{command}"
    end
  end

  def push
    @stack << @register.clone
  end

  def add
    @register += find_pop
  end

  def sub
    @register -= find_pop
  end

  def mult 
    @register *= find_pop
  end

  def div
    @register /= find_pop
  end

  def mod
    @register %= find_pop
  end

  def pop
    @register = find_pop
  end

  def find_pop
    raise EmptyStackError, 'stack empty!' if @stack.empty?
    @stack.pop
  end

  def print 
    puts @register
  end
end

# Examples:

# Minilang.new('PRINT').eval
# # 0

# Minilang.new('5 PUSH 3 MULT PRINT').eval
# # # 15

# Minilang.new('5 PRINT PUSH 3 PRINT ADD PRINT').eval
# # # 5
# # # 3
# # # 8

# Minilang.new('5 PUSH 10 PRINT POP PRINT').eval
# # # 10
# # # 5

# Minilang.new('5 PUSH POP POP PRINT').eval
# # # Empty stack!

# Minilang.new('3 PUSH PUSH 7 DIV MULT PRINT ').eval
# # # 6

# Minilang.new('4 PUSH PUSH 7 MOD MULT PRINT ').eval
# # 12

Minilang.new('-3 PUSH 5 XSUB PRINT').eval
# # Invalid token: XSUB

# Minilang.new('-3 PUSH 5 SUB PRINT').eval
# # # 8

# Minilang.new('6 PUSH').eval
# # # (nothing printed; no PRINT commands)