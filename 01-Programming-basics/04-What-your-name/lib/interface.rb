require_relative "compute_name"

# TODO: ask for the first name
puts "What's your first name: "
f_name = gets.chomp
# TODO: ask for the middle name
puts "What's your middle name: "
m_name = gets.chomp
# TODO: ask for the last name
puts "What's your last name: "
l_name = gets.chomp
# TODO: Print a greeting to the user with the full name concatenated,
#       something like "Hello, Boris Paillard"
puts "Hello, #{compute_name(f_name, m_name, l_name)}"
