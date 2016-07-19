require 'pry'
class Crypto
  def initialize(string)
    @starting_string = string
  end
  
  def normalize_plaintext
    @starting_string.downcase.gsub(/[^a-z 1-9 ]/, '').gsub(/\s+/, "")
  end
  
  def size
    if  Math.sqrt(normalize_plaintext.length) % 1 == 0 
     Math.sqrt(normalize_plaintext.length)
    else
      Integer(Math.sqrt(normalize_plaintext.length) + 1)
    end
  end
  
  def plaintext_segments
    square = []
    (0..size-1).each do |n|
      square.push(normalize_plaintext[n*size..n*size+size-1]) if normalize_plaintext[n*size..n*size+size-1]
    end
    square
  end
  
  def ciphertext
    
    string = ""
    counter = 0
    (0..size-1).each do |x|
      (0..size-1).each do |y|
        counter += 1
        break if counter == normalize_plaintext.length-5
        string += "#{plaintext_segments[y][x]}"
      end
    end
    string
  end
  
end

crypto = Crypto.new('s#$%^&plunk')
p crypto.normalize_plaintext == 'splunk'

crypto = Crypto.new('WHOA HEY!')
p crypto.normalize_plaintext == 'whoahey'

crypto = Crypto.new('Time is an illusion. Lunchtime doubly so.')
p crypto.ciphertext