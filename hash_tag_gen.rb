#https://www.codewars.com/kata/52449b062fb80683ec000024/train/ruby

# It must start with a hashtag (#).
# All words must have their first letter capitalized.
# If the final result is longer than 140 chars it must return false.
# If the input or the result is an empty string it must return false.

# " Hello there thanks for trying my Kata"  =>  "#HelloThereThanksForTryingMyKata"
# "    Hello     World   "                  =>  "#HelloWorld"
# ""                                        =>  false

require 'pry'
require 'byebug'

def generateHashtag(str)
  if str.size > 140 || check_string?(str).to_s.empty?  || check_string?(str).to_s.nil?
    false
  else
    transform_string(str)
  end
end

def transform_string(str)
  arr = ['#']

  arr_from_str = str.downcase.scan(/\w+/).map(&:capitalize!)

  new_arr = (arr + arr_from_str).join('')
  
  if new_arr.size > 140 
    false
  else
    new_arr
  end
end

# def purify_string(str)
#   str.to_s.gsub(/[#_*,^!()-+.0-9]/,'').downcase
# end

def check_string?(str)
  arr_from_str = str.downcase.scan(/\w+/).map(&:capitalize!)
  arr_from_str.join('')
end

# p purify_string("code" + " " * 140 + "wars")
# p transform_string("code" + " " * 140 + "wars")
# p generateHashtag("code" + " " * 140 + "wars")


#########################BEtter solutions######################

    # def generateHashtag(str)
    #   str = "#" << str.split.map(&:capitalize).join
    #   str.size <= 140 && str.size > 1 ? str : false
    # end

    # def generateHashtag(str)
    #   hashtag = '#' + str.scan(/\w+/).map(&:capitalize).join
    #   hashtag.length.between?(2, 140) ? hashtag : false
    # end


    # def generateHashtag(str)
    #   str.size > 1 && str.size <= 140 ? "#" + str.split.map { |x| x.capitalize }.join : false
    # end


    # def generateHashtag(str)
    #   str = str.split.map(&:capitalize).join
    #   if str.length > 139 || str.empty?
    #     return false
    #   else
    #     return "#" + str
    #   end
    # end


    # def generateHashtag(str)
    #   return false if str.strip.empty?
    #   r = "#" + str.split(' ').map(&:capitalize).join
    #   r.size > 140 ? false : r
    # end

    # def generateHashtag(str)
    #   return false if str.strip == ''

    #   str = str.split(' ').map { |word| word.capitalize }.join(' ')
    #   if "##{str.gsub(' ', '')}".length <= 140
    #   "##{str.gsub(' ', '')}"
    #   else
    #     false
    #   end
    # end


    # def generateHashtag(str)
    #   final_string = "#" + str.split(' ').map {|a| a.capitalize}.join("")
      
    #   if final_string.length > 140
    #     return false
    #   elsif str.strip.empty? or final_string.strip.empty? 
    #     return false
    #   else 
    #     return final_string
    #   end 
    # end