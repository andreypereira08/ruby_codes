#  TODO: Define your Controller Class here, to orchestrate the other classes
require_relative "view"
require_relative "recipe"
require_relative "parsing"

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
    recipe = Recipe.new(name_recipe, desc_recipe, "", "?", false)
    @cookbook.create(recipe)
  end

  def remove
    puts "Which of the options below do you want to remove?"
    list
    index = @view.ask_user_for_index
    @cookbook.destroy(index)
  end

  def import
    @parsing = Parsing.new
    word = @view.ask_user_for_import_recipe
    @parsing.import_recipe(word)
    @view.display_import_recipe(@parsing.result)
    #
    import_index = @view.ask_user_for_import_recipe_index
    puts "Importing '#{@parsing.result[import_index]}'..."
    prep_time = @parsing.adiquiring_preptime(@parsing.result[import_index])
    rating = @parsing.rating
    import_recipe = Recipe.new(@parsing.result[import_index], "", prep_time, rating, false)
    @cookbook.create(import_recipe)
  end

  def mark_as_done
    @view.display_list_to_mark_done(@cookbook.all)
    index = @view.ask_user_for_index
    @cookbook.recipes[index].mark_as_done!
  end
end
