class Restaurant
  # TODO: add relevant accessors if necessary
  attr_accessor :city, :name, :average_rating

  def initialize(city, name)
    # TODO: implement constructor with relevant instance variables
    @city = city
    @name = name
    @num_of_ratings = 0
    @sum_of_ratings = 0 
  end
  # TODO: implement .filter_by_city and #rate methods
  def rate(new_rate)
    @num_of_ratings += 1
    @sum_of_ratings += new_rate
    @average_rating = @sum_of_ratings / @num_of_ratings
  end
  def self.filter_by_city(restaurants, city)
    restaurants.select { |restaurant| restaurant.city == city }
  end
end
