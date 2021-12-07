#https://www.codewars.com/kata/52449b062fb80683ec000024/train/ruby

# It must start with a hashtag (#).
# All words must have their first letter capitalized.
# If the final result is longer than 140 chars it must return false.
# If the input or the result is an empty string it must return false.

# " Hello there thanks for trying my Kata"  =>  "#HelloThereThanksForTryingMyKata"
# "    Hello     World   "                  =>  "#HelloWorld"
# ""                                        =>  false

def generateHashtag(str)
  if str.size > 140 || str.empty?  || str.nil?
    false
  else
    transform_string(str)
  end
end

def transform_string(str)
  arr = ['#']

  arr_from_str = purify_string(str).scan(/\w+/).map(&:capitalize!)

  (arr + arr_from_str).join('')
end

def purify_string(str)
  str.to_s.gsub(/[#_*,^!()-+.0-9 ]|\s/,'').downcase
end

p purify_string("code" + " " * 140 + "wars")

p generateHashtag("code" + " " * 140 + "wars")