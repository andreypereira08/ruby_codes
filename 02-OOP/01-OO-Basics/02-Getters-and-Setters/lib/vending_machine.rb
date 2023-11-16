class VendingMachine
  # TODO: add relevant getter/setter to this class to make the scenarios work properly.
  attr_accessor :user_balance_cents, :snack_count, :snack_price_cents, :input_cents

  def initialize(snack_price_cents, snack_count)
    @snack_count = snack_count
    @snack_price_cents = snack_price_cents
    @user_balance_cents = 0
  end

  def insert_coin(input_cents)
    # TODO: what happens to @snack_count, @user_balance_cents and @snack_price_cents
    # when the user inserts a coin?
    @input_cents = input_cents
    bool_coin = false
    bool_coin = true if @user_balance_cents >= @snack_price_cents && @snack_count.positive?
    @user_balance_cents += @input_cents
    return @input_cents if bool_coin
  end

  def buy_snack
    # TODO: what happens to @snack_count, @user_balance_cents and @snack_price_cents
    # when the user pushes a button to buy a Snack?
    #bool_snack = false
    bool_snack = true if @snack_count.positive? && @input_cents > @snack_price_cents
    @snack_count -= 1 if bool_snack && @snack_price_cents-insert_coin >= 0

  end 
end