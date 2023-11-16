# Optional
class Transaction
  attr_reader :amount
  def initialize(amount)
    # Initialize amount and date of transaction
    @amount = amount
  end

  def to_s
    # Nicely print transaction info using Time#strftime.
    signal = @amount.positive? ? "+" : "-"
    date = Time.now.strftime("%d/%m/%y")
    time = Time.now.strftime("%H:%M")
    pm_or_am = Time.now.strftime("%P")
    return "#{signal} #{amount} euros on #{date} at #{time}#{pm_or_am}"
  end
end
