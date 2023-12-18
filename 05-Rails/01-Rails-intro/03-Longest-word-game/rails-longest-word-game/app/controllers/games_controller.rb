require 'open-uri'
require 'json'

class GamesController < ApplicationController
  def new
    @letters = []
    rand(4..20).times { @letters.push(('A'..'Z').to_a.sample) }
  end

  def score
      binding.break
      #type "continue" in your terminal to finish rendering the view 

      @output = {"message" => "" }
      @bool = true

      @attempt = params[:attempt]
      url_dic = "https://wagon-dictionary.herokuapp.com/#{@attempt.delete(" ")}"
      @attempt = params[:attempt].upcase
      @letters = params[:letters]

      string_result = URI.open(url_dic).read
      @json_result = JSON.parse(string_result)

      if @json_result["found"] == false
        @bool = false
        @output["message"] = "Sorry but #{@attempt} does not seem to be a valid English word"
      else
        attempt_chars = @attempt.chars
        attempt_chars.each do |letter|
          letters_chars = @letters.chars
          if letters_chars.include? letter
            @index = @letters.index(letter)
            letters_chars.delete_at(@index)
          else
            @bool = false
            @output["message"] = "Sorry but #{@attempt} can't be built out of #{@letters.chars.join(", ")}"
          end
        end
      end

      if @bool
        @output["message"] = "Congratulations! #{@attempt} is a valid English word"
      end
  end
end