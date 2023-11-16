def tag(tag_name, attributes = nil)
  # TODO: Build HTML tags around content given in the block
  #       The method can be called with an optional HTML attribute inputted as [attr_name, attr_value]
  if attributes.nil?
    wo_attr = "<#{tag_name}>#{yield}</#{tag_name}>"
    return wo_attr
  else
    wi_attr = "<#{tag_name} #{attributes.first}=\"#{attributes.last}\">#{yield}</#{tag_name}>"
    return wi_attr
  end
end