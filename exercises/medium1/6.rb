class GuessingGame
  def initialize
  end
  
  def setup
    @guesses = 7
    @number = (1..100).to_a.sample
  end
  
  def get_guess
    choice = nil
    loop do
      puts "Enter a number between 1 and 100"
      choice = gets.chomp.to_i
      break if choice.between?(1,100)
      puts "Invalid guess"
    end
    choice
  end
  
  def display_guesses_remaining
    puts "You have #{@guesses} guesses remaning."
  end

  def play
    setup
    loop do
      if @guesses == 0
        puts "You are out of guesses"
        return
      end
      
      display_guesses_remaining
      guess = get_guess
      
      if guess == @number
        puts "You win!"
        return
      end
      
      if guess > @number 
        puts "Your guess is too high"
      elsif guess < @number
        puts "Your guess is too low"
      end
      @guesses -= 1 
    end
    
  end
end


game = GuessingGame.new
game.play


game.play

