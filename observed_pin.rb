# https://www.codewars.com/kata/5263c6999e0f40dee200059d/train/ruby
# it is possible that each of the digits he saw could actually be another 
# adjacent digit (horizontally or vertically, but not diagonally). E.g. 
# instead of the 1 it could also be the 2 or 4. 
# And instead of the 5 it could also be the 2, 4, 6 or 8.

# returns an array
# with a length of 1 to 8 digits
# please note that all PINs, the observed one and also the results,
# must be strings, because of potentially leading '0's
# can be repeated by count of each array element 
# problem with duplicates with iterate

def get_pins(observed)
  finish_arr = []

  all_digits_arr = current_arr_seq(observed).map

  if all_digits_arr.size == 1
    return all_digits_arr
  elsif all_digits_arr.size <= 8 && finish_arr.size <= all_digits_arr.size 
    var_numbers = all_digits_arr.sample(all_digits_arr.size).join(",")
    finish_arr <<  var_numbers
  end

  all_digits_arr.each do |num|

  end
  var_numbers = all_digits_arr.sample(all_digits_arr.size).join(",")
  finish_arr <<  var_numbers

  while test
    
  end

  finish_arr
end

def digit_sequences
  {
    "zero":  [0, 8],
    "one":   [1, 2, 4],
    "two":   [2, 1, 3, 5],
    "three": [3, 2, 6],
    "four":  [4, 1, 5, 7],
    "five":  [5, 2, 4, 6, 8],
    "six":   [6, 3, 5, 9],
    "seven": [7, 4, 8],
    "eight": [8, 0, 7, 5, 9],
    "nine":  [9, 8, 6]
  }
end

def current_arr_seq(seq)
  arr_from_seq = seq.split("").map(&:to_i)
  
  hash_seq_from_arg = []
  
  arr_from_seq.each do |seq_digit|
    case seq_digit
    when 0
      hash_seq_from_arg << digit_sequences[:zero]
    when 1
      hash_seq_from_arg << digit_sequences[:one]
    when 2
      hash_seq_from_arg << digit_sequences[:two]
    when 3
      hash_seq_from_arg << digit_sequences[:three]
    when 4
      hash_seq_from_arg << digit_sequences[:four]
    when 5
      hash_seq_from_arg << digit_sequences[:five]
    when 6
      hash_seq_from_arg << digit_sequences[:six]
    when 7
      hash_seq_from_arg << digit_sequences[:seven]
    when 8
      hash_seq_from_arg << digit_sequences[:eight]
    when 9
      hash_seq_from_arg << digit_sequences[:nine]
    end 
  end

  hash_seq_from_arg.flatten
end

#pp digit_sequences[:zero]
pp current_arr_seq('912345')