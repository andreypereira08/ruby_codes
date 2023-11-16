def french_phone_number?(phone_number)
  # TODO: true or false?
  # altere o regex referente aos numeros que iniciam com 0
  return phone_number.match?(/(0[1-9](\s?|-?)\d{2}(\s?|-?)\d{2}(\s?|-?)\d{2}(\s?|-?)\d{2})|(\+33(\s?[0-9])(\s?\d){8})/)
end
