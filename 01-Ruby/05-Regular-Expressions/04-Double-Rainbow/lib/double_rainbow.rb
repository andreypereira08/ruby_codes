def word_contains_at_least_two_p(sentence)
  # TODO: return the first word in `sentence` containing two 'p's or more
  regexp = /\w*p\w*p\w*/
  sentence.match(regexp)[0]
end

def word_before_exclamation_mark(sentence)
  # TODO: return the first word located before an exclamation mark
  # Hint: you may want to use `()` groups!
  return sentence.match(/\w+(?=!)/).to_s
end

def four_letter_word(sentence)
  # TODO: return the first four-letter word starting with 'b', followed with a comma `,`
  sentence = sentence.match(/b\w{2}\w,/).to_s
  return sentence.gsub(",", "")
end

def last_five_letters(sentence)
  # TODO: return the last five letters of the sentence
  return sentence.match(/\w{5}.?$/).to_s
end

def word_contains_ll(sentence)
  # TODO: return the first word containing two consecutive 'l'
  return sentence.match(/\w*ll\w*/).to_s
end

def six_letter_word(sentence)
  # TODO: return the first six-letter word, composed of letters from 'a' to 'r'
  return sentence.match(/[a-r]{6}/).to_s
end

def all_capital_letters(sentence)
  # TODO: return all the capital letters as a string
  # Hint: use `scan` to get all the occurences then `join` them
  sentence = sentence.scan(/[A-Z]/)
  return sentence.join
end
