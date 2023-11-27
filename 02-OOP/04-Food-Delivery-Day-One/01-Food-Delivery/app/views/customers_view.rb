class CustomersView
    def display_list(customers)
        customers.each do |customer|
            puts "#{customer.id}. #{customer.name} | address: #{customer.address}"
        end
    end

    def ask_for_name_customer
      puts "Puts name of your customer"
      return gets.chomp
    end

    def ask_for_address_customer
        puts "Type address of your customer"
        return gets.chomp
    end
end
