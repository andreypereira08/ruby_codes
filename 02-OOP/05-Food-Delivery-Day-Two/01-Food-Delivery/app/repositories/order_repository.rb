require_relative "../models/order.rb"
require 'csv'

class OrderRepository
    attr_accessor :orders_csv_path, :meal_repository, :customer_repository, :employee_repository, :next_id, :undelivered_orders
    attr_writer :orders

    def initialize(orders_csv_path, meal_repository, customer_repository, employee_repository)
      @orders_csv_path = orders_csv_path || File.new(orders_csv_path, "w")
      @meal_repository = meal_repository
      @customer_repository = customer_repository
      @employee_repository = employee_repository
      @orders = []
      @undelivered_orders = []
      @next_id = 1
      begin
          load_csv
      rescue
          File.new orders_csv_path, "w"
      end
    end

    def all
      @orders
    end
    
    def create(order)
        order.id = @next_id
        @next_id += 1
        @orders << order
        save_csv
    end

    def list_orders_undelivered(rider)
        @undelivered_orders = @orders.select do |order| 
            order.employee == rider && !order.delivered?
        end 
    end

    def mark_as_delivered(order)
        order.deliver!
        save_csv
    end

    def undelivered_orders#undelivered_orders
        @orders.reject { |order| order.delivered? }
    end
    
    private
    
    def save_csv
        CSV.open(@orders_csv_path, "wb") do |csv|
            csv << ["id", "delivered", "meal_id", "customer_id", "employee_id"]
            @orders.each do |order|
                csv << [order.id, order.delivered, order.meal.id, order.customer.id, order.employee.id]
            end
        end
    end

    def load_csv
        CSV.foreach(@orders_csv_path, headers: :first_row, header_converters: :symbol) do |row|
            row[:id] = row[:id].to_i
            row[:delivered] = row[:delivered] == "true"
            row[:meal] = @meal_repository.find(row[:meal_id].to_i)
            row[:customer] = @customer_repository.find(row[:customer_id].to_i)
            row[:employee] = @employee_repository.find(row[:employee_id].to_i)
            @orders << Order.new(row)
        end
        @next_id = @orders.empty? ? 1 : @orders.last.id + 1
    end
    
  end