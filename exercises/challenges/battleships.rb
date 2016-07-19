require 'pry'

class Cell
  EMPTY_VALUE = "/"
  SHIP_VALUE = "X"
  
  attr_accessor :value, :shot_at
  
  def initialize
    @value = nil
    @shot_at = false
  end
  
  def display
    if shot_at
      value ? SHIP_VALUE : EMPTY_VALUE
    else
      " "
    end
  end
  
  def place_ship(ship)
    @value = ship
  end
  
  def empty?
    !value
  end
  
  def shoot
    self.shot_at = true
    value.hit if value
  end
    
  def to_s
    "value: #{value}, shot_at: #{shot_at}"
  end
end

class Board
  attr_accessor :board
  
  def initialize
    @board = []
    (0..4).each do |x|
      @board.push([])
      (0..4).each do |y|
        @board[x].push( Cell.new )
      end
    end
  end
  
  
  def display
    system 'clear'
    puts "    1   2   3   4   5"
    puts "  +---+---+---+---+---+"
    @board.each_with_index do |line, idx|
      puts "#{idx+1} | #{line[0].display} | #{line[1].display} | #{line[2].display} | #{line[3].display} | #{line[4].display} |"
      puts "  +---+---+---+---+---+"
    end
  end
  
  def get_possible_positions(size)
    empty = []
    (0..4).each do |x|
      (0..4).each do |y|
        empty.push([x,y]) if board[x][y].empty?
      end
    end
    empty
  end
  
  def place_ship(ship)
    coord = get_possible_positions(ship.size).sample
    board[coord[0]][coord[1]].place_ship(ship)
  end
  
  def fire_at(coord)
    board[coord[0]][coord[1]].shoot
  end
  
  def to_s
    board.each do |x|
      x.to_s
    end
  end
    
end    

class Ship
  NAMES = {1 => "Destroyer", 2 => "Cruiser", 3 => "Battleship"}
  
   attr_accessor :size, :name, :health
  
  def initialize(size)
    @size = size
    @health = size
    @name = NAMES[size]
  end

  def state
    alive? ? "Sunk" : "Alive"
  end
  
  def alive?
    health != 0
  end
  
  def hit
    self.health -= 1
  end

end
  
class Game
  attr_accessor :board, :ships
  
  def initialize
    @board = Board.new
    @ships = [Ship.new(1), Ship.new(1), Ship.new(1)]
    place_ships
  end
  
  def place_ships
    p ships
    ships.each do |ship|
      puts "placing ship"
      board.place_ship(ship)
      puts "placed ship"
      puts ""
      puts board
      puts ""
    end
  end
  
  def show_ships
    ships.each do |ship|
      puts "#{ship.name}: #{ship.state}"
    end
  end
    
  def all_ships_dead?
    ships.each do |ship|
      return false if ship.alive?
    end
    true
  end
  
  def play
    loop do
      display_board
      show_ships
      make_shot
      break if all_ships_dead?
    end
    puts "Well done, you won!"
  end
  
  def display_board
    board.display
  end
  
  def make_shot
    puts "Please select a square to open fire!"
    target = nil
    loop do
      target = gets.chomp
      break if target =~ /^[1-5],[1-5]$/
      puts "Sorry, that's not a valid input"
    end
    board.fire_at(target.split(",").map(&:to_i).map{ |x| x-1})
  end


end


g = Game.new

g.play