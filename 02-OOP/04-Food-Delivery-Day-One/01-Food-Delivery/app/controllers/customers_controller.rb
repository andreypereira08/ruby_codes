require_relative "../views/customers_view.rb"
require_relative "../models/customer.rb"

class CustomersController
    def initialize(customerrepository)
        @customerrepository = customerrepository
        @view = CustomersView.new
    end

    def list
        @view.display_list(@customerrepository.all)
    end

    def add
      name_customer = @view.ask_for_name_customer
      address_customer = @view.ask_for_address_customer
      customer = Customer.new()
      customer.name = name_customer
      customer.address = address_customer
      @customerrepository.create(customer)
    end
end