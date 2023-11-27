require_relative "../models/meal.rb"
require 'csv'

class MealRepository
    attr_accessor :csv_path, :next_id
    attr_writer :meals

    def initialize(csv_path)
        @csv_path = csv_path || File.new(csv_path, "w")
        @meals = []
        @next_id = 1
        begin
            load_csv
        rescue
            File.new csv_path, "w"
        end
    end

    def create(meal)
        meal.id = @next_id
        @next_id += 1
        @meals << meal
        save_csv
    end

    def all
        @meals
    end

    def find(id)
        @meals.find { |meal| meal.id == id }
    end

    def load_csv
        CSV.foreach(@csv_path, headers: :first_row, header_converters: :symbol) do |row|
            row[:id] = row[0].to_i
            row[:name] = row[1]
            row[:price] = row[2].to_i
            @meals << Meal.new(row)
        end
        @next_id = @meals.empty? ? 1 : @meals.last.id + 1
    end

    def save_csv
        CSV.open(@csv_path, "w") do |csv|
            csv << ["id, name, price"]
            @meals.each do |meal|
                csv << [meal.id, meal.name, meal.price]
            end
        end
    end
end