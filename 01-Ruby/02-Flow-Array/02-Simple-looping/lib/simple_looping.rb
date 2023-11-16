def sum_with_for(min, max)
  # CONSTRAINT: you should use a for..end structure
  if min > max
    return -1
  else
    v0 = 0
    for num in (min..max).to_a
      v0 += num
    end
    return v0
  end
end

def sum_with_while(min, max)
  lista = (min..max).to_a
  v0 = 0
  # CONSTRAINT: you should use a while..end structure
  if min > max
    return -1
  else
    counter = 0
    while counter < lista.size
      v0 += lista[counter]
      counter += 1
    end
    return v0
  end
end
