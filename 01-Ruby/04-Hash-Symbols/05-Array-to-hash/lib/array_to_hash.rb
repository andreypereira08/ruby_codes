def array_to_hash(array)
  wi_ind = {}
  array.each_with_index do |value, index|
    if block_given?
      wi_ind["key#{index}"] = value.to_s
    else
      wi_ind[index.to_s] = value.to_s
    end
  end
  wi_ind
end
