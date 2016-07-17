module Taste
  def flavor(flavor)
    puts "#{flavor}"
  end
end

class Orange
  include Taste
end

class HotSauce
  include Taste
end

# orange and hotsauce will look in own class before looking in modules

puts Orange.ancestors
puts HotSauce.ancestors
