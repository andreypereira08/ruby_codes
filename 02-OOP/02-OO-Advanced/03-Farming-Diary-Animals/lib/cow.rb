require_relative "animal.rb"
class Cow < Animal
    attr_reader :milk
    def initialize
        super
        @milk = 0
    end
    def feed!
        super
        @milk += 2
    end

    def talk
        @animal_noise = "moo"
        return @animal_noise
    end

end
