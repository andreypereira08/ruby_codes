require_relative "../views/meals_view.rb"
require_relative "../models/meal.rb"

class MealsController
    def initialize(meal_repository)
        @meal_repository = meal_repository
        @view = MealsView.new
    end

    def list
        @view.display_list(@meal_repository.all)
    end

    def add
      name_meal = @view.ask_for_name_meal
      price_meal = @view.ask_for_price_meal
      meal = Meal.new()
      meal.name = name_meal
      meal.price = price_meal
      @meal_repository.create(meal)
    end
end