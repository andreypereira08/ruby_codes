class MealsView
    def display_list(meals)
        meals.each do |meal|
            puts "#{meal.id}. #{meal.name} | Price: #{meal.price}"
        end
    end

    def ask_for_name_meal
      puts "Puts name of your meal"
      return gets.chomp
    end

    def ask_for_price_meal
        puts "Type price of your meal"
        return gets.chomp.to_i
    end
end
