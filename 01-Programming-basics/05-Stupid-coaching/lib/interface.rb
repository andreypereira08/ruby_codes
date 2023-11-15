require_relative "coach_answer"
# TODO: Implement the program that makes you discuss with your coach from the terminal.
puts "talk with your coach! digit something: "
message = ""
while message != "I am going to work right now!"
    puts "me: #{message = gets.chomp}"
    puts "coach: #{coach_answer_enhanced(message)}"
    puts "-----------------------------------"
end