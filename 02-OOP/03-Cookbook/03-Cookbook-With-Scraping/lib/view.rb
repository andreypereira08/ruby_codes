# TODO: Define your View class here, to display elements to the user and ask them for their input
class View
    def display_list(recipes)
      recipes.each_with_index do |recipe, index|
        puts "#{index + 1}. #{recipe.name} (#{recipe.rating} / 5) | Prep_Time: #{recipe.prep_time}"
      end
    end

    def display_list_to_mark_done(recipes)
      recipes.each_with_index do |recipe, index|
        done = recipe.done == true ? "[X]" : "[ ]"
        puts "#{index + 1}. #{done} #{recipe.name} (#{recipe.rating} / 5)"
      end
    end

    def display_import_recipe(import_recipes)
      import_recipes.each_with_index do |element, index|
        puts "#{index + 1}. #{element}"
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

    def ask_user_for_import_recipe
      puts "What ingredient would you like a recipe for?"
      return gets.chomp
    end

    def ask_user_for_import_recipe_index
      puts "Which recipe would you like to import? (enter index)"
      return gets.chomp.to_i - 1
      #
    end
end
