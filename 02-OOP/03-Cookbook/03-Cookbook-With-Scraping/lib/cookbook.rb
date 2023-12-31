# TODO: Implement the Cookbook class that will be our repository
require_relative "recipe"
require "csv"
class Cookbook
  attr_accessor :recipes, :csv_file_path
  
  def initialize(csv_file_path)
    @csv_file_path = csv_file_path
    @recipes = []
    load_csv
  end
  
  def create(recipe)
    @recipes << recipe
    save_csv
  end
  
  def all
    @recipes
  end
  
  def destroy(recipe_index)
    @recipes.delete_at(recipe_index)
    save_csv
  end
  
  private
  
  def load_csv
    CSV.foreach(@csv_file_path) do |row|
        create(Recipe.new(row[0], row[1], row[2], row[3], row[4]))
    end
  end
  
  def save_csv
    CSV.open(@csv_file_path, "w") do |csv|
      @recipes.each do |recipe|
        csv << [recipe.name, recipe.description, recipe.prep_time, recipe.rating, recipe.done]
      end
    end
  end
end  