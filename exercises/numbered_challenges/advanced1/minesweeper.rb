class Board
  def self.transform(inp)
    board = self.coded_board(inp)
    board = self.codify(board)
    p board
  end
  
  def self.coded_board(inp)
    coded_board = Array.new(6,[[]])
    p coded_board
    inp.each_with_index do |x, x_idx|
      x.chars[1..-2].each_with_index do |y, y_idx|
        coded_board[x_idx][y_idx] = (y == "*" ? 1 : 0 )
      end
    end
    coded_board
  end
  
  
  def self.codify(board)
    board.each_with_index do |x, x_idx|
      x.each_with_index do |y, y_idx|
        puts "x_idx is #{x_idx}, y_idx is #{y_idx}"
        puts "x is #{x}, y is #{y}"
        next if y == 1
        diagonals = Board.get_diagonals(x_idx, y_idx)
        p diagonals
        count = 0
        diagonals.each do |coord|
          puts "coord is #{coord}"
          puts "coord value is #{board[coord[0],coord[1]] }"
          if board[coord[0]]
            if board[coord[0]][coord[1]] == 1
              count += 1 
            end
          end
            
            
          puts "count is #{count}"
        end
        board[x_idx][y_idx] = count
      end
    end
    board
  end
        
  
  def self.get_diagonals(x, y)
    diagonals = []
    ([-1,0,1].repeated_combination(2).to_a - [0,0]).each do |diag|
      p diagonals
      diagonals.push([x+diag[0], y+diag[1]])
    end
    diagonals
  end
    
        
      
  
end
inp = ['+------+', '| *  * |', '|  *   |', '|    * |', '|   * *|',
           '| *  * |', '|      |', '+------+']
Board.transform(inp)