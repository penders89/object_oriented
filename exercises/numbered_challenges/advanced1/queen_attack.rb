class Queens
  attr_reader :white, :black

  def initialize(positions = { white: [0, 3], black: [7, 3] })
    raise ArgumentError if positions[:white] == positions[:black]
    @white = positions[:white]
    @black = positions[:black]
  end

  def attack?
    return true if same_row? || same_column? || diagonal?
  end

  def same_row?
    white[0] == black[0]
  end

  def same_column?
    white[1] == black[1]
  end

  def diagonal?
    (white[0] - black[0]).abs == (white[1] - black[1]).abs
  end

  def to_s
    str = ""
    8.times do |row|
      16.times do |col|
        if col == 15
          str << "\n" unless row == 7
        elsif row == white[0] && col == white[1] * 2
          str << "W"
        elsif row == black[0] && col == black[1] * 2
          str << "B"
        elsif col.even?
          str << "_"
        else
          str << " "
        end
      end
    end
    str
  end
end
