class Robot
  DIRECTIONS = [:north, :east, :south, :west]

  attr_accessor :bearing, :coordinates

  def initialize
    @coordinates = [nil, nil]
  end

  def orient(direction)
    raise ArgumentError unless DIRECTIONS.include?(direction)
    @bearing = direction
  end

  def turn_right
    self.bearing = DIRECTIONS[(DIRECTIONS.index(bearing) + 1) % DIRECTIONS.size]
  end

  def turn_left
    self.bearing = DIRECTIONS[(DIRECTIONS.index(bearing) +
                                DIRECTIONS.size - 1) % DIRECTIONS.size]
  end

  def at(coord1, coord2)
    coordinates[0] = coord1
    coordinates[1] = coord2
  end

  def advance
    case bearing
    when :north
      coordinates[1] += 1
    when :east
      coordinates[0] += 1
    when :south
      coordinates[1] -= 1
    when :west
      coordinates[0] -= 1
    end
  end
end

class Simulator
  DIRECTION_LOOKUP = { "L" => :turn_left, "R" => :turn_right, "A" => :advance }

  def initialize
  end

  def instructions(dir)
    commands = []
    dir.chars.each do |char|
      commands << DIRECTION_LOOKUP[char]
    end
    commands
  end

  def place(robot, options)
    robot.at(options[:x], options[:y])
    robot.orient(options[:direction])
  end

  def evaluate(robot, directions)
    instructions(directions).each do |instruction|
      robot.send(instruction)
    end
  end
end
