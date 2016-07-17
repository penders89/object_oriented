class Television
  def self.manufacturer
    # method logic
  end

  def model
    # method logic
  end
end


tv = Television.new # creates new television instance
# tv.manufacturer # error, as it's a class method
tv.model # fine

Television.manufacturer # runs method
# Television.model # errors