require_relative "../models/customer.rb"
require 'csv'

class CustomerRepository
    attr_accessor :csv_path, :next_id
    attr_writer :customers

    def initialize(csv_path)
        @csv_path = csv_path || File.new(csv_path, "w")
        @customers = []
        @next_id = 1
        begin
            load_csv
        rescue
            File.new csv_path, "w"
        end
    end

    def create(customer)
        customer.id = @next_id
        @next_id += 1
        @customers << customer
        save_csv
    end

    def all
        @customers
    end

    def find(id)
        @customers.find { |customer| customer.id == id }
    end

    def load_csv
        CSV.foreach(@csv_path, headers: :first_row, header_converters: :symbol) do |row|
            row[:id] = row[0].to_i
            row[:name] = row[1]
            row[:address] = row[2]
            @customers << Customer.new(row)
        end
        @next_id = @customers.empty? ? 1 : @customers.last.id + 1
    end

    def save_csv
        CSV.open(@csv_path, "w") do |csv|
            csv << ["id", "name", "address"]
            @customers.each do |customer|
                csv << [customer.id, customer.name, customer.address]
            end
        end
    end
end