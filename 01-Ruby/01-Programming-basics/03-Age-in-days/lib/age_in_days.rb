# This "require" line loads the contents of the "date" file from the standard
# Ruby library, giving you access to the Date class.
require "date"

def age_in_days(day, month, year)
  b_date = Date.strptime("#{day}-#{month}-#{year}", "%d-%m-%Y")
  return (Date.today - b_date).to_i
  # TODO: return the age expressed in days given the day, month, and year of birth
end
