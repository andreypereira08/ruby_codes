class Recipe
    attr_reader :name, :description, :prep_time, :rating, :done

    def initialize(name, description, prep_time, rating, done)
        @name = name
        @description = description
        @prep_time = prep_time
        @rating = rating #avaliação da receita[]
        @done = done
    end
    
    def mark_as_done!
        @done = true
    end
end
