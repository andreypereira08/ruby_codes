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
    @height += 1 if @age <= 10
    @fruits = 0
    # TODO: check if the tree has survived
    # TODO: if so, make the tree grow
    # TODO: and produce fruits
  end

  def pick_a_fruit!
    return @fruits-=1 
    return @fruits = 0 if @fruits == 0
  end
  
  def dead?
    dead = false
    dead = true if @age >= 100
    dead = true if @age > 50 && @age == rand(@age..100)
    return dead
  end
  
  def fruits
    @fruits += 100 if @age < 10 && @age > 5
    @fruits += 200 if @age >= 10 && @age < 15
    return @fruits
  end


end
