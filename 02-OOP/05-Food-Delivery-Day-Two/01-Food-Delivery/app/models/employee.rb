class Employee
    attr_accessor :id, :username, :password, :role
    
    def initialize(attributes = {})
        @id = attributes[:id]
        @username = attributes[:username]
        @password = attributes[:password]
        @role = attributes[:role]
    end

    def manager?
      return @role == "manager"
    end

    def rider?
        return @role == "rider"
      end
end