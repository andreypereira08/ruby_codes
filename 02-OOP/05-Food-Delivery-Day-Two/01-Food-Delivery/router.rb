# TODO: implement the router of your app.
require 'csv'

class Router
  attr_accessor :user
  def initialize(meals_controller, customers_controller, employees_controller, orders_controller)
    @meals_controller = meals_controller
    @customers_controller = customers_controller
    @employees_controller = employees_controller
    @orders_controller = orders_controller
    @running = true 
  end

  def run
    puts "Welcome to the Food Delivery!"
    puts "           --           "

    @user = @employees_controller.login
    while @running
      if @user.manager?
        #if your role is 'manager'
        puts "Welcome to the manager area"
        display_tasks_manager
        action = gets.chomp.to_i
        print `clear`
        route_action_manager(action)
      else #or elsif @user.rider?
        #if your role is rider
        puts "Welcome to the rider area"
        display_tasks_rider
        action = gets.chomp.to_i
        print `clear`
        route_action_rider(action)
      end
    end
  end

  private

  def route_action_manager(action)
    case action
    when 1 then @meals_controller.add
    when 2 then @meals_controller.list
    when 3 then @customers_controller.add
    when 4 then @customers_controller.list
    when 5 then @orders_controller.add
    when 6 then @orders_controller.list_orders
    when 7 then @orders_controller.list_undelivered_orders
    #[ ] As a manager, I can add a new order
    #[ ] As a manager, I can list all the undelivered orders
    when 9 then stop
    else
      puts "Please press 1, 2, 3, 4 or 5"
    end
  end

  def route_action_rider(action)
    case action
    when 1 then @orders_controller.list_my_orders(@user)
    when 2 then @orders_controller.mark_as_delivered(@user)
    when 9 then stop
    else
      puts "Please press 9 to exit" 
    end
  end

  def stop
    @running = false
  end

  def display_tasks_manager
    puts ""
    puts "What do you want to do next?"
    puts "1 - add a new meal"
    puts "2 - list all the meals"
    puts "3 - add a new customers"
    puts "4 - list all the customers"
    puts "5 - add new order"
    puts "6 - list all orders"
    puts "7 - list all orders undelivered"
    puts "9 - Stop and exit the program"
  end

  def display_tasks_rider
    puts ""
    puts "What do you want to do next?"
    puts "1 - List my orders"
    puts "2 - Mark order as delivered"
    puts "9 - Stop and exit the pragram"
  end
end