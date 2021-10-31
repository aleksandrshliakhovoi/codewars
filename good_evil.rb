

# Input:
# The function will be given two parameters. Each parameter will be a string of multiple integers separated by a single space. Each string will contain the count of each race on the side of good and evil.

# The first parameter will contain the count of each race on the side of good in the following order:

# Hobbits, Men, Elves, Dwarves, Eagles, Wizards.
# The second parameter will contain the count of 
#each race on the side of evil in the following order:

# Orcs, Men, Wargs, Goblins, Uruk Hai, Trolls, Wizards.
# All values are non-negative integers. 
# The resulting sum of the worth for each side will not exceed the limit of a 32-bit integer.
#exmp '1 0 0 0 0 0'

def good_vs_evil(good, evil)
  if calculate_power_good(good) > calculate_power_evil(evil)
    "Battle Result: Good triumphs over Evil"
  elsif calculate_power_good(good) < calculate_power_evil(evil)
    "Battle Result: Evil eradicates all trace of Good"
  else
    "Battle Result: No victor on this battle field"
  end


end

def calculate_power_good(str)
  arr = parse_value(str)
  
  good_side_power = {
    hobbits: 1,
    men: 2,
    elves: 3,
    dwarves: 3,
    eagles: 4,
    wizards: 10
  }

  {
    hobbits_power: arr[0] * good_side_power[:hobbits],
    men_power:     arr[1] * good_side_power[:men],
    elves_power:   arr[2] * good_side_power[:elves],
    dwarves_power: arr[3] * good_side_power[:dwarves],
    eagles_power:  arr[4] * good_side_power[:eagles],
    wizards_power: arr[5] * good_side_power[:wizards]
  }.values.reduce(0) { |sum,x| sum + x }
end

def calculate_power_evil(str)
  arr = parse_value(str)

  evil_side_power = {
    orcs: 1,
    men: 2,
    wargs: 2,
    goblins: 2,
    uruk_hai: 3,
    trolls: 5,
    wizards: 10
  }

  {
    orcs_power:     arr[0] * evil_side_power[:orcs],
    men_power:      arr[1] * evil_side_power[:men],
    wargs_power:    arr[2] * evil_side_power[:wargs],
    goblins_power:  arr[3] * evil_side_power[:goblins],
    uruk_hai_power: arr[4] * evil_side_power[:uruk_hai],
    trolls_power:   arr[5] * evil_side_power[:trolls],
    wizards_power:  arr[6] * evil_side_power[:wizards]
  }.values.reduce(0) { |sum,x| sum + x }
end

def parse_value(str)
  str.split.map(&:to_i)
end


# OTHER SOLUTIONS

#1

  # def total_worth(counts, worth_table)
  #   counts.split.each_with_index.reduce(0) { |sum, (c, i)| sum + ( worth_table[i] * c.to_i ) }
  # end 

  # def goodVsEvil(good, evil)
  #   case total_worth(good, [1,2,3,3,4,10]) <=> total_worth(evil, [1, 2, 2, 2, 3, 5, 10])
  #   when 1 then "Battle Result: Good triumphs over Evil"
  #   when -1 then "Battle Result: Evil eradicates all trace of Good"
  #   when 0 then "Battle Result: No victor on this battle field"
  #   end 
  # end

#2

  # def goodVsEvil(good, evil)
  #   goodtot = good.split(' ').zip([1,2,3,3,4,10]).map { |a, b| a.to_i * b }.reduce(:+)
  #   eviltot = evil.split(' ').zip([1,2,2,2,3,5,10]).map { |a, b| a.to_i * b }.reduce(:+)
  #   if goodtot > eviltot
  #     "Battle Result: Good triumphs over Evil" 
  #   elsif eviltot > goodtot
  #     "Battle Result: Evil eradicates all trace of Good" 
  #   else
  #     "Battle Result: No victor on this battle field"
  #   end
  # end

#3

  # GOOD_WORTH = [1, 2, 3, 3, 4, 10].freeze
  # EVIL_WORTH = [1, 2, 2, 2, 3, 5, 10].freeze

  # def goodVsEvil(good, evil)
  #   sum_worth = ->(sum, (n, worth)) { sum + n.to_i * worth }
  #   good_total = good.split.zip(GOOD_WORTH).inject(0, &sum_worth)
  #   evil_total = evil.split.zip(EVIL_WORTH).inject(0, &sum_worth)

  #   result = case good_total <=> evil_total
  #            when 1 then "Good triumphs over Evil"
  #            when -1 then "Evil eradicates all trace of Good"
  #            else "No victor on this battle field"
  #            end

  #   "Battle Result: #{result}"
  # end

#4

  # def goodVsEvil(good, evil, good_worth = [1, 2, 3, 3, 4, 10], evil_worth  = [1, 2, 2, 2, 3, 5, 10])
  #   good, evil = [[good, good_worth], [evil, evil_worth]].map { |ar| ar.first.split.map.with_index { |count, index| count.to_i * ar.last[index] }.inject(:+) }
  #   'Battle Result: ' + (good > evil ? 'Good triumphs over Evil' : good < evil ? 'Evil eradicates all trace of Good' : 'No victor on this battle field')
  # end

#5

  # def goodVsEvil(good, evil)
  #   diff=good.split.map!(&:to_i).zip([1,2,3,3,4,10]).map! {|p| p.reduce &:*}.reduce(&:+) - evil.split.map!(&:to_i).zip([1,2,2,2,3,5,10]).map! {|p| p.reduce &:*}.reduce(&:+)
  #   if diff.zero?
  #     'Battle Result: No victor on this battle field'
  #   elsif diff>0
  #     'Battle Result: Good triumphs over Evil'
  #   else
  #     'Battle Result: Evil eradicates all trace of Good'
  #   end
  # end

#6

  # def goodVsEvil(good, evil)
  #   sum = -> (s, score) { s.split.map(&:to_i).zip(score).reduce(0){|y,(a,b)| y+ a*b} }
  #   'Battle Result: ' + ['No victor on this battle field', 'Good triumphs over Evil', 'Evil eradicates all trace of Good'][sum.call(good, [1,2,3,3,4,10]) <=> sum.call(evil, [1,2,2,2,3,5,10])]
  # end