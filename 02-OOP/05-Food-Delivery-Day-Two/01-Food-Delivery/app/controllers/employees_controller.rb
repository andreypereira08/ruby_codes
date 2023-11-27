require_relative "../views/employees_view.rb"
require_relative "../models/employee.rb"

class EmployeesController
    def initialize(employee_repository)
        @employee_repository = employee_repository
        @view = EmployeesView.new
    end

    def login
        username = @view.ask_username
        password = @view.ask_password
        employee = @employee_repository.find_by_username(username)

        return employee if employee.username == username && employee.password == password
        puts "Wrong credentials... Try again!"
    end
end