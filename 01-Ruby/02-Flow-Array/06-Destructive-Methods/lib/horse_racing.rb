def horse_racing_format!(race_array)
  # TODO: modify the given array so that it is horse racing consistent. This method should return nil.
  race_array.reverse!
  i = 0
  aux_c = race_array.size
  race_array.each do |race_array|
    race_array.insert(-1, "!")
    race_array.insert(0, "#{aux_c - i}-")
    i += 1
  end
  return race_array
end
