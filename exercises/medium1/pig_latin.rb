class PigLatin
  def self.translate(str)
    if ['a', 'e', 'i', 'o', 'u'].include? str[0]
      new_string = str + "ay"
    else
      new_string = str[1..str.length-1] + str[0] + "ay"
    end
  new_string
  end
  
  
end


puts PigLatin.translate("yapple")