## Background & Objectives

- Learn to look for the right method in the Ruby doc.
- Get familiar with using IRB to experiment with new methods and make them yours.

IRB is a [REPL](http://en.wikipedia.org/wiki/Read%E2%80%93eval%E2%80%93print_loop) for Ruby. It works like this:

1. It **R**-eads the expression written by the user, which can be any valid Ruby expression like `"Hello"`, `2+2`, `"hello".upcase` ...
2. It **E**-valuates the result of this expression.
3. It **P**-rints this result.
4. It **L**-oops back to point 1, waiting for a new user input.

- **Experiment the following lines** on IRB:

```ruby
"A string object".class
19.class
[1, 2, 3].class
"A string object".upcase
"A string object".downcase
[1, 2, 3].shuffle
```

In Ruby, everything (text, an integer, a floating number, an array...) is an object. We can call methods on these objects. Such methods are called **instance methods** since they can only be called on instances of the class. The object on which we call the method is called the **receiver**.

## Specs

Find the right Ruby methods of the [String class](http://ruby-doc.org/core-2.5.3/String.html), the [Integer class](http://ruby-doc.org/core-2.5.3/Integer.html), and the [Array class](http://ruby-doc.org/core-2.5.3/Array.html) to plug in and make the tests pass.

Code is all about being smart and knowing how and where to look for the info you need! Often, the most difficult step is to ask google the right question. To find the methods you'll need for this challenge, use:

* Google and [Stack Overflow](http://stackoverflow.com/)
* [The Ruby doc](http://ruby-doc.org) if you have a rough idea of the method you are looking for.

When you think you've found the method you're looking for, and you think you know how to use it, use IRB to test this method on something! Experimenting on IRB is a crucial step for beginners.

## Key learning points

Are you able to answer the following questions? If not, you're not ready to move on!

- How many built-in Ruby classes do you know? Which ones?
- What's the syntax to call a method on an object of these classes?
- What should be the immediate 1st step when you're looking to perform a standard operation (sorting an array, upcasing a word, etc.)?
- What's the second step, to make sure you really understand the method you found?


## Solution

### [`lib/buddy.rb`](https://github.com/andreypereira08/ruby_codes/blob/main/01-Ruby/01-Programming-basics/02-Experiment-methods/lib/experiment.rb)

#### ***Warning:***
>- One line of code for each method
>- Just look in the doc for the right method of the String, Integer, and Array classes

---

- Return a copy of the string with leading and trailing whitespaces removed
```ruby
def get_rid_of_surrounding_whitespaces(a_string)
  return a_string.strip
  # example: get_rid_of_surrounding_whitespaces("  hey yo  ") => "hey yo"
end
```

- Return true if a_string contains a_word
```ruby
def belongs_to?(a_string, a_word)
  return a_string.include? a_word
  # example: belongs_to?("hey jude", "jude") => true
end
```

- Return a copy of the string with the new letter replacing the old one
```ruby
def replace(initial_string, old_letter, new_letter)
  return initial_string.gsub(old_letter, new_letter)
  # example: replace("casanova", "a", "o") => "cosonovo"
end
```

- Return division of an_integer by a_divider (computing the floating division, NOT the euclidean one)
```ruby
def exactly_divide(an_integer, a_divider)
  return an_integer / a_divider.to_f
  # example: exactly_divide(13, 4) => 3.25
end
```

- Return true if an_integer is divisible by 2
```ruby
def divisible_by_two?(an_integer)
  return an_integer.even?
  # example: divisible_by_two?(6) => true
end
```

- Return a random subset of an_array with size sample_size
```ruby
def random_subset(an_array, sample_size)
  return an_array.sample(sample_size)
  # example: random_subset(("a".."z").to_a, 4) => ["u", "q", "l", "t"]
end
```

- Return a randomized copy of an_array
```ruby
def randomize(an_array)
  return an_array.sample(an_array.length)
  # example: randomize([1, 2, 3, 4]) => [2, 1, 4, 3]
end
```

- Return a copy of an_array with elements in ascending order
```ruby
def ascending_order(an_array)
  return an_array.sort
  # example: ascending_order([7, 3, 1, 6, 9]) => [1, 3, 6, 7, 9]
end
```
