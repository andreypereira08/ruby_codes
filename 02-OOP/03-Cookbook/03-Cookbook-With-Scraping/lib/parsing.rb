require "nokogiri"
require "open-uri"
require_relative "view"

class Parsing
    attr_accessor :result
    def initialize
        @result = []
    end
    def import_recipe(word)
        url = "https://www.allrecipes.com/search?q=#{word}"
        doc = Nokogiri::HTML.parse(URI.open(url).read, nil, "utf-8")
        doc.search(".card__title-text").each do |element|
            @result << element.text
        end
        @result = @result.take(5)
    end
end
