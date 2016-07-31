class Palindromes
  attr_reader :min_factor, :max_factor
  
  def initialize(hash)
    @max_factor = hash[:max_factor]
    @min_factor = hash[:min_factor] || 1
  end
  
  def generate
    @palindromes = {}
    (min_factor..max_factor).each do |x|
      (min_factor..max_factor).each do |y|
        if (x*y).to_s == (x*y).to_s.reverse
          if @palindromes[x*y]
            @palindromes[x*y].push([x,y])
          else
            @palindromes[x*y] = [[x,y]]
          end
        end
      end
    end
  end
  
  def largest
    result = [@palindromes.keys.max, @palindromes[@palindromes.keys.max]]
    Result.new(result[0],result[1])
  end
  
  def smallest
    result = [@palindromes.keys.min, @palindromes[@palindromes.keys.min]]
    Result.new(result[0],result[1])
  end
    


end

class Result
  attr_reader :value, :factors
  def initialize(value, factors)
    @value = value
    @factors = factors.map(&:sort).uniq
  end
end

 