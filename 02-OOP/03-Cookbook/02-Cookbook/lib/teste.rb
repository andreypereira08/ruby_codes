require "csv"
puts "olé mundo"
recipes = []
CSV.foreach("spec/recipes.csv") do |row|
    recipes << [row[0], row[1]]
end

puts "___________________________________"
recipes.each do |recipe|
    puts "#{recipe[0]}, #{recipe[1]}"
end