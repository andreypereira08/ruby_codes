require_relative "croupier"

# TODO: make the user play from terminal in a while loop that will stop
#       when the user will not be asking for  a new card
bank_score = pick_bank_score
player_score = pick_player_card

res = ""
while res != "n" && "not"
    puts state_of_the_game(player_score, bank_score)
    puts "Card? 'y' or 'yes' to get a new card"
    res = gets.chomp
    while res != "y" && "yes"
        puts "Invalid command"
        puts "Card? 'y' or 'yes' to get a new card"
        res = gets.chomp
        break if res == "n" || "not"
    end
    player_score += pick_player_card
    break if player_score > 21
end

puts end_game_message(player_score, bank_score)