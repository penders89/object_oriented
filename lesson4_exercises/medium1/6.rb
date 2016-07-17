class Computer
  attr_accessor :template

  def create_template
    @template = "template 14231" # directly alter instance variable
  end#

  def show_template
    template # works same in both cases 
  end
end


class Computer
  attr_accessor :template

  def create_template
    self.template = "template 14231" # use setter method 
  end

  def show_template
    self.template # works same in both cases, self is redundnat
  end
end