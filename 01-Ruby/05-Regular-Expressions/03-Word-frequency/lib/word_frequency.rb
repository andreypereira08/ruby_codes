def most_common_words(file_name, stop_words_file_name, number_of_word)
  # TODO: return hash of occurences of number_of_word most frequent words
  result = {}
  lines = []
  stop_words = []
  File.open(stop_words_file_name, "r").each_line do |stop_word|
    stop_word = stop_word.gsub("\n", "")
    stop_words.push(stop_word)
  end

  File.open(file_name, "r").each_line do |line|
    line = line.gsub(/'s|,|\./, "")
    lines.push(line.downcase)
  end

  words = {}
  lines.each do |line|
    line.split.each do |word|
      if words.keys.include? word
        words[word] += 1
      else
        words[word] = 1
      end
    end
  end

  stop_words.each do |stop_word|
    words.delete(stop_word)
  end
  
  result = result.merge(words)
  result = result.sort_by { |_key, value| -value }.to_h
  result = result.take(number_of_word).to_h
  return result
end