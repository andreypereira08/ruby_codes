require "nokogiri"
require "open-uri"
require_relative "view"

class Parsing
    attr_accessor :result, :time_prep_time, :rating
    def initialize
        @result = []
        @time_prep_time# = []
        #@html_file_to_recipe
        @rating = 0
    end
    def import_recipe(word)
        url = "https://www.allrecipes.com/search?q=#{word}"
        doc = Nokogiri::HTML.parse(URI.open(url).read, nil, "utf-8")
        doc.search(".card__title-text").each do |element|
            @result << element.text
        end
        @result = @result.take(5)
    end

    
    def adiquiring_preptime(selected_word)
      url = "https://www.allrecipes.com/search?q=#{selected_word}"
      html_file = URI.open(url).read
      html_doc = Nokogiri::HTML.parse(html_file)
      
      recipe_link = html_doc.search("#mntl-card-list-items_1-0").attribute("href").value #link da receita
      html_file_to_recipe = URI.open(recipe_link).read
      html_file_to_recipe = Nokogiri::HTML.parse(html_file_to_recipe)
      prep_time = html_file_to_recipe.search(".mntl-recipe-details__value").first.text
      @time_prep_time = prep_time
      @rating = adiquiring_rating(html_file_to_recipe)
      return @time_prep_time
    end

    def adiquiring_rating(link_of_recipe)
        stars = link_of_recipe.search("#mntl-recipe-review-bar__star-rating_1-0 svg")
        rating_star = 5
        stars.each do |star|
            each_star = star.attribute("class").value.to_s
            rating_star -= 0.5 if each_star.match(/icon-star-half/)
            rating_star -= 1 if each_star.match(/icon-star-empty/)
        end
        return rating_star 
    end
end
