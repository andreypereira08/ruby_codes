class Recipe
    attr_reader :name, :description

    def initialize(name, description)
        @name = name
        @description = description
        @rating #avaliação da receita[]
        @prep_time 
    end
end
