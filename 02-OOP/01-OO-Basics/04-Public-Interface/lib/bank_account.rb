# This is how you define your own custom exception classes
require_relative "transaction"
class DepositError < StandardError
end

class BankAccount
  # Contract for the BankAccount class
  # - you can access full owner's name and balance, but partial IBAN #=> take(first(3)) take(last(3))
  # - you cannot access full IBAN
  # - you can print partial account info
  # - you can print transactions only with a password
  # - you can withdraw or deposit money
  # - You can see the balance of the account (through the balance variable)

  MIN_DEPOSIT = 100
  attr_reader :name, :balance
  
  def initialize(name, iban, initial_deposit, password)
    fail DepositError, "Insufficient deposit" unless initial_deposit >= MIN_DEPOSIT

    @password     = password
    @transactions = []
    @balance      = 0
    @name         = name
    @iban         = iban

    add_transaction(initial_deposit)
  end

  def withdraw(amount)
    # TODO: Call add_transaction with the right argument
    # TODO: returns a string with a message
    add_transaction(-amount)
    return "You’ve just withdrawn #{amount} euros"
  end

  def deposit(amount)
    # TODO: Call add_transaction with the right argument
    # TODO: returns a string with a message
    add_transaction(amount)
    return "You’ve just deposited #{amount} euros"
  end

  def transactions_history(args = {})
    # TODO: Check if there is a password and if so if it is correct
    # TODO: return a string displaying the transactions, BUT NOT return the transaction array!
    if args.empty?
      return "no password given"
    elsif args[:password] != @password
      return "wrong password"
    else
      @transactions.to_s
    end
  end

  def to_s
    # Method used when printing account object as string (also used for string interpolation)
    # TODO: return a string with the account owner, the hidden iban and the balance of the account
    return "#{@name} - IBAN: #{iban} - balance: #{@balance} euros"
  end

  
  def iban
    # TODO: Hide the middle of the IBAN like FR14**************606 and return it
    iban1 = @iban.match(/^(\w|\d){4}/)
    iban2 = @iban.match(/(\w|\d){3}$/)
    iban_aux = @iban
    iban_aux = iban_aux.split("-")
    result = iban_aux.select { |iten| iten.gsub(/\d*|\w*/, "*") if iten != iban_aux.first && iten != iban_aux.last  }
    iban = []
    result.each do |element|
      iban << element.gsub(/./, "*")
    end
    iban_final = []
    iban_final << iban1 << iban << iban2
    @iban = iban_final.join
  end
  
  private

  def add_transaction(amount)
    # TODO: add the amount in the transactions array
    # TODO: update the current balance (which represents the balance of the account)
    @balance += amount
    @transactions << amount
  end

end