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

  all_digits_arr = current_arr_seq(observed)

  if all_digits_arr.size == 1
    return all_digits_arr.map!(&:to_s)
  else
    z = all_digits_arr.map(&:to_s).combination(observed.size).to_a if observed.size <= 8
    z.each { |seq| finish_arr << seq.join('') }
  end
  finish_arr.uniq.sort
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
  
  arr_seq_from_arg = []
  
  arr_from_seq.each do |seq_digit|
    case seq_digit
    when 0
      arr_seq_from_arg << digit_sequences[:zero]
    when 1
      arr_seq_from_arg << digit_sequences[:one]
    when 2
      arr_seq_from_arg << digit_sequences[:two]
    when 3
      arr_seq_from_arg << digit_sequences[:three]
    when 4
      arr_seq_from_arg << digit_sequences[:four]
    when 5
      arr_seq_from_arg << digit_sequences[:five]
    when 6
      arr_seq_from_arg << digit_sequences[:six]
    when 7
      arr_seq_from_arg << digit_sequences[:seven]
    when 8
      arr_seq_from_arg << digit_sequences[:eight]
    when 9
      arr_seq_from_arg << digit_sequences[:nine]
    end 
  end

  # get all numbers from income sequence in array structure
  arr_seq_from_arg.flatten
end

#pp digit_sequences[:zero]
# pp current_arr_seq('912345')

# pp current_arr_seq('11')

p get_pins('11')
p get_pins('369')

# "three": [3, 2, 6],
# "six":   [6, 3, 5, 9],
# "nine":  [9, 8, 6]



# RIGTH CASES

  # def get_pins(observed)
  #   mapping = {
  #     "1" => %w(1 2 4), 
  #     "2" => %w(1 2 3 5),
  #     "3" => %w(2 3 6), 
  #     "4" => %w(1 4 5 7), 
  #     "5" => %w(2 4 5 6 8), 
  #     "6" => %w(3 5 6 9), 
  #     "7" => %w(4 7 8), 
  #     "8" => %w(5 7 8 9 0), 
  #     "9" => %w(6 8 9), 
  #     "0" => %w(8 0)
  #   }
  #   observed.split(//).map {|key| mapping[key] }.reduce {|m, x| m.product(x).map(&:join) }
  # end


  # def get_pins(observed)
  #   observed.chars.map(&{
  #     '1' => [[1],[2],[4]],     '2' => [[1],[2],[3],[5]],     '3' => [[2],[3],[6]],
  #     '4' => [[1],[4],[5],[7]], '5' => [[2],[4],[5],[6],[8]], '6' => [[3],[5],[6],[9]],
  #     '7' => [[4],[7],[8]],     '8' => [[5],[7],[8],[9],[0]], '9' => [[6],[8],[9]],
  #     '0' => [[0],[8]],
  #   }).reduce(&:product).map(&:join)
  # end


  # def get_pins(observed)
  #   nears = ['08 ', '124 ', '2135 ', '326 ', '4157 ', '52468 ', '6359 ', '748 ', '85790 ', '968 ']
  #   observed = observed.gsub(/(\d)/){nears[$1.to_i]}.split.map{|s| s = s.chars.to_a}
  #   observed.first.product(*observed.drop(1)).map{|x| x.join}
  # end


  # require 'matrix'

  # KEYPAD = Matrix[
  #   ["1", "2", "3"],
  #   ["4", "5", "6"],
  #   ["7", "8", "9"],
  #   [nil, "0", nil]
  # ]

  # def get_pins(observed)
  #   combos = observed.chars.map { |char|
  #     row, col = KEYPAD.index(char)

  #   [[row, col]]
  #       .concat([row].product([col - 1, col + 1].reject { |i| i < 0 }))
  #       .concat([row - 1, row + 1].reject { |i| i < 0 }.product([col]))
  #       .map { |index| KEYPAD.element(*index) }
  #       .compact
  #   }

  #   combos.shift.product(*combos).map(&:join)
  # end

  # DIGIT_VARIATIONS = {
  #   '0' => %w(0 8),
  #   '1' => %w(1 2 4),
  #   '2' => %w(1 2 3 5),
  #   '3' => %w(2 3 6),
  #   '4' => %w(1 4 5 7),
  #   '5' => %w(2 4 5 6 8),
  #   '6' => %w(3 5 6 9),
  #   '7' => %w(4 7 8),
  #   '8' => %w(0 5 7 8 9),
  #   '9' => %w(6 8 9)
  # }
  
  # def get_pins(observed)
  #   digit_sets = observed.chars.map{ |d| DIGIT_VARIATIONS[d] }
  #   digit_sets.inject(['']) do |variations, digit_set|
  #     variations = variations.map{ |v| digit_set.map {|d| "#{v}#{d}"} }.flatten
  #   end
  # end