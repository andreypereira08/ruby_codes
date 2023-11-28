# TODO: require relevant files to bootstrap the app.
# Then you can test your program with:
require_relative "app/repositories/meal_repository.rb"
require_relative "app/controllers/meals_controller.rb"

require_relative "app/repositories/customer_repository.rb"
require_relative "app/controllers/customers_controller.rb"

require_relative "app/repositories/employee_repository.rb"
require_relative "app/controllers/employees_controller.rb"

require_relative "app/repositories/order_repository.rb"
require_relative "app/controllers/orders_controller.rb"

require_relative 'router.rb'
require "csv"

csv_file_meal = File.join(__dir__, "data/meals.csv")
meal_repository = MealRepository.new(csv_file_meal)
meals_controller = MealsController.new(meal_repository)

csv_file_customers = File.join(__dir__, "data/customers.csv")
customer_repository = CustomerRepository.new(csv_file_customers)
customers_controller = CustomersController.new(customer_repository)

csv_file_employees = File.join(__dir__, "data/employees.csv")
employee_repository = EmployeeRepository.new(csv_file_employees)
employees_controller = EmployeesController.new(employee_repository)

csv_file_orders = File.join(__dir__, "data/orders.csv")
order_repository = OrderRepository.new(csv_file_orders, meal_repository, customer_repository, employee_repository)
orders_controller = OrdersController.new(meal_repository, customer_repository, employee_repository, order_repository)

router = Router.new(meals_controller, customers_controller, employees_controller, orders_controller)

# Start the app
router.run
