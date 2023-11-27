require_relative "../models/employee.rb"
require 'csv'


class EmployeeRepository
    attr_accessor :riders, :next_id
    attr_reader :csv_path
    attr_writer :employees
    
    def initialize(csv_path)
        @csv_path = csv_path || File.new(csv_path, "w")
        @riders = []
        @employees = []
        @next_id = 1
        begin
            load_csv
        rescue
            File.new csv_path, "w"
        end
    end

    def all
      @employees
    end
    
    def all_riders
        @employees.select { |employee| employee.rider? }
    end

    def find(id)
        @employees.find { |employee| employee.id == id }
    end

    def find_by_username(username)
        @employees.find { |employee| employee.username == username }
    end

    def load_csv
        CSV.foreach(@csv_path, headers: :first_row, header_converters: :symbol) do |row|
            row[:id] = row[0].to_i
            row[:username] = row[1]
            row[:password] = row[2]
            row[:role] = row[3]
            @employees << Employee.new(row)
        end
        @next_id = @employees.empty? ? 1 : @employees.last.id + 1
    end
end