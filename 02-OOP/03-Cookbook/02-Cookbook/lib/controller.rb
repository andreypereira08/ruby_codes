#  TODO: Define your Controller Class here, to orchestrate the other classes
require_relative "view"
require_relative "recipe"

class Controller
  def initialize(cookbook)
    @cookbook = cookbook
    @view = View.new
  end

  def list
    @view.display_list(@cookbook.all)
  end

  def add
    name_recipe = @view.ask_user_for_name
    desc_recipe = @view.ask_user_for_descripition
    recipe = Recipe.new(name_recipe, desc_recipe)
    @cookbook.create(recipe)
  end

  def remove
    puts "Which of the options below do you want to remove?"
    list
    index = @view.ask_user_for_index
    @cookbook.destroy(index)
  end
end