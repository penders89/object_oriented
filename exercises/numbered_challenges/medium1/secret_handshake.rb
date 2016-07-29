class SecretHandshake
  COMMANDS = {0 => "wink",
              1 => "double blink",
              2 => "close your eyes",
              3 => "jump"
            }
  
  attr_reader :num
  
  def initialize(num)
    @num = num
  end
  
  def commands
    return [] if !num.is_a? (Integer)
    binary = num.to_s(2).chars 
    commands = []
    binary.reverse.each_with_index do |digit, idx|
      commands << COMMANDS[idx] if digit == "1" && idx < 4
      commands.reverse! if idx == 4
    end
    commands
  end
  
  
end