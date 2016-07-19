class Cell
  SHIP_MARKER = "X"
  BLANK_MARKER = "/"
  
  attr_accessor :ship, :shot_at
  
  def initialize
    @ship = nil
    @shot_at = false
  end
  
  def shot_at?
    shot_at
  end
  
  def empty?
    !ship
  end
  
  def place(sh)
    @ship = sh
  end
  
  def display
    if shot_at
      ship ? SHIP_MARKER : BLANK_MARKER
    else
      " "
    end
  end
  
  def shoot
    self.shot_at = true
    ship.shoot if ship
  end
  
end

class Board
  BOARD_SIZE = 5
  
  attr_accessor :cells
  
  def initialize
    @cells = []
    (0...BOARD_SIZE).each do |x|
      cells.push([])
      BOARD_SIZE.times do
        cells[x].push(Cell.new)
      end
    end
  end
  
  def get_empty_positions(size)
    empty_cells = []
    (0...BOARD_SIZE).each do |x|
      (0..BOARD_SIZE - size).each do |y|
        count = 0
        size.times do |n|
           count += 1 if cells[x][y+n].empty?
        end
        puts "vertical count is #{count}"
        empty_cells.push([x, y, "V"]) if count == size
      end
    end
    (0...BOARD_SIZE).each do |y|
      (0..BOARD_SIZE - size).each do |x|
        count = 0
        size.times do |n|
           count += 1 if cells[x+n][y].empty?
        end
        empty_cells.push([x, y, "H"]) if count == size
      end
    end
    empty_cells
  end
  
  def display
    puts "    1   2   3   4   5"
    puts "  +---+---+---+---+---+"
    @cells.each_with_index do |line, idx|
      puts "#{idx+1} | #{line[0].display} | #{line[1].display} | #{line[2].display} | #{line[3].display} | #{line[4].display} |"
      puts "  +---+---+---+---+---+"
    end
  end
  
  def place_ship(ship, coord)
    if coord[2] == "H"
      ship.size.times do |n|
        cells[coord[0]+n][coord[1]].place(ship)
      end
    elsif coord[2] == "V"
      ship.size.times do |n|
        cells[coord[0]][coord[1]+n].place(ship)
      end
    end
  end
    
    
end

class Ship
  NAMES = { 1 => "Destroyer", 2 => "Cruiser", 3 => "Battleship" }
  
  attr_reader :size
  
  def initialize(size)
    @size = size
    @health = size
    @name = NAMES[size]
  end
  
  def alive?
    @health != 0
  end
  
  def state
    alive? ? "Alive" : "Sunk"
  end
  
  def display
    puts "#{@name} : #{state}"
  end
  
  def shoot
    @health -= 1
  end

end


class Game
  attr_accessor :player_board, :computer_board, :player_ships, :computer_ships
  
  def initialize
    @player_board = Board.new
    @computer_board = Board.new
    @player_ships = [Ship.new(1), Ship.new(2), Ship.new(3)]
    @computer_ships = [Ship.new(1), Ship.new(2), Ship.new(3)]
    place_ships(player_ships, player_board)
    place_ships(computer_ships, computer_board)
  end

  def place_ships(ships, board)
    ships.each do |ship|
      coord = board.get_empty_positions(ship.size).sample
      board.place_ship(ship, coord)
    end
  end
  
  def display_welcome
    puts "Welcome to Battleships!"
  end
  
  def display_name(name)
    puts "#{name}"
  end
  
  def display_board(board)
    board.display
  end
  
  def display_ships(ships)
    ships.each do |ship|
      ship.display
    end
    puts ""
  end
  
  def player_shot
    puts "Please select a square to open fire!"
    target = nil
    target_coord = nil
    loop do
      target = gets.chomp
      if target !~ /^[1-5],[1-5]$/
        puts "Sorry, that's not a valid input"
        next
      else
        target_coord = target.split(",").map(&:to_i).map{ |x| x-1}
        if computer_board.cells[target_coord[1]][target_coord[0]].shot_at?
          puts "You've already shot there!"
          next
        end
      end
      break
    end
    target_coord = target.split(",").map(&:to_i).map{ |x| x-1}
    computer_board.cells[target_coord[1]][target_coord[0]].shoot
  end
  
  def computer_shot
    player_board.cells.flatten.select{ |cell| !cell.shot_at?}.sample.shoot
  end
    
  
  def all_ships_dead?(ships)
    ships.each do |ship|
      return false if ship.alive?
    end
    true
  end
  
  def display_result
    puts "Well done, you won!"
  end
  
  def display_goodbye
    puts "Thanks for playing battleships"
  end
  
  def clear
    system 'clear'
  end
  
  def play
    display_welcome
    loop do
      clear
      display_name("Computer board:")
      display_board(computer_board)
      display_ships(computer_ships)
      display_name("Player board:")
      display_board(player_board)
      display_ships(player_ships)
      player_shot
      computer_shot
      break if all_ships_dead? (player_ships)
      break if all_ships_dead? (computer_ships)
    end
    display_result
    display_goodbye
  end
  
end

game = Game.new
game.play




