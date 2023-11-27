class EmployeesView
    def ask_username
        puts "username?"
        gets.chomp
    end

    def ask_password
        puts "password?"
        gets.chomp
    end

    def display(employees)
        employees.each_with_index do |employee, index|
            puts "#{index + 1}. #{employee.username}"
        end
    end
end