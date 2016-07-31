require 'pry'

class Game
  SCOREABLE_FRAMES = 10
  
  attr_accessor :current_frame, :frames
  def initialize
    @frames = Array.new(12) { Frame.new }
    @strike_bonus = 0
    @spare_bonus = 0
    @current_frame = 0
  end
  
  def roll(pins)
    raise RuntimeError, 'Pins must have a value from 0 to 10' unless (0..10).include? pins
    if game_ended?
      raise RuntimeError, 'Should not be able to roll after game is over'
    elsif frames[current_frame].finished?
      self.current_frame += 1
    end
    raise RuntimeError, 'Pin count exceeds pins on the lane' unless frames[current_frame].valid_add?(pins)
    frames[current_frame].add(pins)
  end

  def game_ended?
    if current_frame == (SCOREABLE_FRAMES - 1) && !extra_rolls? && frames[current_frame].full?
      return true
    elsif current_frame == SCOREABLE_FRAMES && final_frame_spare?
      return true
    elsif current_frame == SCOREABLE_FRAMES && final_frame_strike? && frames[SCOREABLE_FRAMES].full?
      return true
    elsif current_frame == SCOREABLE_FRAMES + 1
      return true
    else
      return false
    end
  end
      
      
  
  def extra_rolls?
    final_frame_spare? || final_frame_strike?
  end
    
    
  
  def final_frame_spare?
    frames[SCOREABLE_FRAMES - 1].spare?
  end
  
  def final_frame_strike?
    frames[SCOREABLE_FRAMES - 1].strike?
  end
  
  def score
    raise RuntimeError,  'Game is not yet over, cannot score!' unless game_ended?
    basic_score = frames[0...SCOREABLE_FRAMES].map(&:total_score).compact.reduce(&:+)
    score_spares
    score_strikes
    basic_score + @spare_bonus + @strike_bonus
  end

  def score_spares
    frames[0...SCOREABLE_FRAMES].each_with_index do |frame, idx|
      if frame.spare?
        @spare_bonus += frames[idx + 1].scores[0] || 0
      end
    end
  end
  
  def score_strikes
    frames[0...SCOREABLE_FRAMES].each_with_index do |frame, idx|
      if frame.strike?
        if frames[idx + 1].strike?
          @strike_bonus += frames[idx+1].scores[0] || 0 
          @strike_bonus += frames[idx+2].scores[0] || 0
        else
          @strike_bonus += frames[idx+1].total_score || 0
        end
      end
    end
  end


end

class Frame
  attr_accessor :scores
  
  def initialize
    @scores = []
  end
  
  def finished?
    scores.length == 2 || scores[0] == 10
  end
  
  def add(pins)
    @scores.push pins
  end
  
  def valid_add?(pins)
    if scores.size == 1
      if ((scores[0]  + pins) > 10)
        return false
      else
        return true
      end
    else
      return true
    end
  end
  
  def total_score
    scores.flatten.reduce(&:+)
  end
  
  def spare?
    scores.size == 2 && total_score == 10
  end
  
  def strike?
    scores.size == 1 && total_score == 10
  end
  
  def empty?
    scores.empty?
  end
  
  def full?
    scores.size == 2
  end
end


    