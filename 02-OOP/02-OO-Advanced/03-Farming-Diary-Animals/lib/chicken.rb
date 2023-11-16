require_relative "animal.rb"
class Chicken < Animal
    attr_reader :gender, :eggs
    attr_accessor :energy
    def initialize(gender)
        @energy = 0
        @eggs = 0
        @gender = gender
    end
    def feed!
        super
        @eggs += 2 if @gender == "female"
    end
    
    def talk
        @animal_noise = "cock-a-doodle-doo" if @gender == "male"
        @animal_noise = "cluck cluck" if @gender == "female"
        return @animal_noise
    end
end
