require_relative "../views/orders_view.rb"
require_relative "../views/meals_view.rb"
require_relative "../views/customers_view.rb"
require_relative "../views/employees_view.rb"
require_relative "../models/order.rb"

class OrdersController
    def initialize(meal_repository, customer_repository, employee_repository, order_repository)
        @meal_repository = meal_repository
        @meals_view = MealsView.new
        @customer_repository = customer_repository
        @customers_view = CustomersView.new
        @employee_repository = employee_repository
        @employees_view = EmployeesView.new
        @order_repository = order_repository
        @view = OrdersView.new
    end

    def add #as manager
      puts "choose the meal"
      meals = @meal_repository.all
      @meals_view.display_list(meals)
      meal_index = @view.ask_for_index
      puts meal_index + 1
      meal = meals[meal_index]

      puts "choose the customer"
      customers = @customer_repository.all
      @customers_view.display_list(customers)
      customer_index = @view.ask_for_index
      customer = customers[customer_index]
      puts customer_index + 1

      puts "choose the employee"
      employees = @employee_repository.all
      @employees_view.display(employees)
      employee_index = @view.ask_for_index
      puts employee_index + 1
      employee = employees[employee_index]

      order = Order.new()
      order.meal = meal
      order.customer = customer
      order.employee = employee
      @order_repository.create(order)
    end

    def list_orders #all orders | accessible in the manager area
      orders = @order_repository.all
      @view.display(orders)
    end

    def list_my_orders(rider) #rider
      orders = @order_repository.list_orders_undelivered(rider)
      @view.display(orders)
    end

    def mark_as_delivered(rider) #rider
      list_my_orders(rider)
      index = @view.ask_for_index
      orders = @order_repository.list_orders_undelivered(rider)
      order = orders[index]
      @order_repository.mark_as_delivered(order) 
    end

    def list_undelivered_orders
      orders = @order_repository.undelivered_orders
      @view.display(orders)
    end
end