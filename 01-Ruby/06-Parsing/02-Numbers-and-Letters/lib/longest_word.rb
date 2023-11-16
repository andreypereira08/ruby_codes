require 'open-uri'
require 'json'

def generate_grid(grid_size)
  # TODO: generate random grid of letters
  chars = ('A'..'Z').to_a
  random_grid = []
  grid_size.times do
    random_grid.push(chars.sample)
  end
  return random_grid
end

def run_game(attempt, grid, start_time, end_time)
  # TODO: runs the game and return detailed hash of result (with `:score`, `:message` and `:time` keys)
  url_dic = "https://wagon-dictionary.herokuapp.com/#{attempt}"
  string_result = URI.open(url_dic).read
  json_result = JSON.parse(string_result) #verific if a english word

  attempt.upcase!
  attempt_list = attempt.chars

  bool = true
  message = ""
  #checa se todos os caracteres da palavra recebida estao no grid
  if json_result["found"] == false
    bool = false
    message = "not an english word"
  elsif attempt_list.length > grid.length
    bool = false
    message = "not in the grid"
  else
    attempt_list.each do |letter|
      if grid.include? letter
        index = grid.find_index(letter)
        grid.delete_at(index)
      else
        bool = false
        message = "not in the grid"
      end
    end
  end

  time = end_time - start_time
  if bool
    score = attempt.length**3 / time
    message = "well done"
  else
    score = 0
  end

  {score: score, message: message, time: time}
end