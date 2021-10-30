require 'set'

an_1 = "teachers"
an_2 = "Ch!ea1te3rrs"

def anagram?(anagram_1, anagram_2)
  transform_to_set(anagram_1) == transform_to_set(anagram_2) ? true : false
end

def sanitaze_char(str)
  if str.empty? || str.nil?
    puts 'wrong data'
  else
    str.to_s.downcase.gsub(/[!()-+.0-9]/,'')
  end
end

def transform_to_set(str)
  sanitaze_char(str).split('').to_set
end

p anagram?(an_1, an_2)