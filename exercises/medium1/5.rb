require 'pry'

class Minilang
  COMMANDS = ['PUSH', 'ADD', 'SUB', 'MULT', 'DIV', 'MOD', 'POP', 'PRINT']
  
  attr_accessor :register, :stack
  
  def initialize(command_string)
    @register = 0
    @stack = []
    @command_string = command_string
  end
  
  def is_integer?(string)
    string.to_i.to_s == string
  end
  
  def eval
    commands = @command_string.split
    commands.each do |cmd|
      if is_integer?(cmd)
        # puts "updating register"
        update_register(cmd.to_i)
      elsif COMMANDS.include?(cmd)
         #puts "executing #{cmd}"
        send("#{cmd.downcase}")
      else
        raise Exception
      end
    end
  end
  
  def update_register(value)
    self.register = value
  end
  
  def push
    stack.push(register)
  end
  
  def add
    self.register += stack.pop
  end
  
  def sub
    stack_empty
    self.register -= stack.pop
  end
    
  def mult
    stack_empty

    self.register *= stack.pop
  end
  
  def mod
    stack_empty
    self.register %= stack.pop
  end
  
  def pop
    stack_empty
    self.register = stack.pop
  end
  
  def div
    self.register /= stack.pop
  end
    
    
  def print
    puts "#{register.to_s}"
  end
    
  def stack_empty
    raise Exception if stack == []
  end
        
end


 Minilang.new('PRINT').eval
# 0

 Minilang.new('5 PUSH 3 MULT PRINT').eval
# 15

 Minilang.new('5 PRINT PUSH 3 PRINT ADD PRINT').eval
# 5
# 3
# 8

 Minilang.new('5 PUSH 10 PRINT POP PRINT').eval
# 10
# 5

 # Minilang.new('5 PUSH POP POP PRINT').eval
# Empty stack!

 Minilang.new('3 PUSH PUSH 7 DIV MULT PRINT ').eval
# 6

 Minilang.new('4 PUSH PUSH 7 MOD MULT PRINT ').eval
# 12

# Minilang.new('-3 PUSH 5 XSUB PRINT').eval
# Invalid token: XSUB

 Minilang.new('-3 PUSH 5 SUB PRINT').eval
# 8

 Minilang.new('6 PUSH').eval
# (nothing printed; no PRINT commands)