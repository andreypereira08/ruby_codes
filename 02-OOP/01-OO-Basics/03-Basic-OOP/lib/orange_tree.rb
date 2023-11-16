class OrangeTree
  # TODO: Implement all the specs defined in the README.md :)
  attr_accessor :age, :height, :fruits

  def initialize
    @age = 0
    @height = 0
    @fruits = 0
  end

  def one_year_passes!
    @age += 1
    @fruits = 0
    @height += 1 if @age <= 10

    if !dead?
      if @age > 5 && @age < 10
        @fruits += 100
      elsif @age >= 10 && @age < 15
        @fruits += 200
      end
    end
  end

  def pick_a_fruit!
    if @fruits > 0
      @fruits -= 1 
    end
  end
  
  def dead?
    if @age >= 100
      true
    elsif @age > 50 && @age == rand(@age..100)
      true
    else
      false
    end
  end
end
