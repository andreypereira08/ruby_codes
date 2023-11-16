require_relative "wagon_sort"

# TODO: Ask the user about students to add to the Wagon.
#       Remember, to read an input from the command line, use:
#       - `gets`:  https://ruby-doc.org/core-2.7.5/Kernel.html#method-i-gets
#       - `chomp`: https://ruby-doc.org/core-2.7.5/String.html#method-i-chomp

students = []

while 10 == 10
    size_s = students.size
    puts "Type a student name:" if size_s.zero?
    puts "Type another student name or press enter to finish:" if size_s >= 1
    a_student = gets.chomp
    if a_student != ""
        students.push(a_student)
    else
        break
    end
end

# TODO: Then call `wagon_sort` method defined in the wagon_sort.rb
#       file and display the sorted student list

students = wagon_sort(students)
result = ""
counter = students.size
students.each do |student|
    counter = counter - 1
    result += "#{student}, " if counter > 1
    result += "#{student} and " if counter == 1
    result += student.to_s if counter.zero?
end

puts "Congratulations! Your Wagon has #{students.size} students:"
puts result
