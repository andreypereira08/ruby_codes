# TODO: Define your View class here, to display elements to the user and ask them for their input
class View
    def display_list(recipes)
      recipes.each_with_index do |recipe, index|
        puts "#{index + 1}. #{recipe.name}"
      end
    end

    def ask_user_for_name
      puts "Puts name of your recipe"
      return gets.chomp
    end

    def ask_user_for_descripition
        puts "Type about this recipe"
        return gets.chomp    
    end

    def ask_user_for_index
      puts "Which index do you choose?"
      return gets.chomp.to_i - 1
      #
    end
end
