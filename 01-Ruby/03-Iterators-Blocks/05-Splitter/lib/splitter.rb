def size_splitter(array, size)
  # TODO: Return an array of two arrays, the first containing
  #       words of length `size`, the second containing all the other words
  #       In addition to this split, each array should be *sorted*.
  first_a = array.select do |word|
    word.size == size
  end

  secund_a = array.reject do |word|
    word.size == size
  end

  return first_a.sort, secund_a.sort
end

def block_splitter(array)
  # TODO: Return an array of two arrays, the first containing
  #       elements for which the given block yields true,
  #       the second containing all the other elements.
  #       No sort needed this time.
  first_a = array.select do |word|
    yield(word) == true
  end

  secund_a = array.reject do |word|
    yield(word) == true
  end

  return first_a, secund_a
end
