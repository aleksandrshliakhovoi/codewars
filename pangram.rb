# A pangram is a sentence that contains every single letter of the alphabet at least once. 
# For example, the sentence "The quick brown fox jumps over the lazy dog" is a pangram, 
# because it uses the letters A-Z at least once (case is irrelevant).

# Given a string, detect whether or not it is a pangram. 
# Return True if it is, False if not. Ignore numbers and punctuation.

# def pangram?(string)
#   arr = string.downcase.scan(/[a-z]/)
#   p arr
#   p arr.uniq.size
#   if arr.uniq.length == arr.length && arr.length == 26
#     return true
#   else
#     return false
#   end
# end


def pangram?(string)
  ('a'..'z').all? { |word| string.downcase.include? (word) }
end

p pangram?('Cwm fjord bank glyphs vext quiz is a pangram')
p pangram?('The quick brown fox jumps over the lazy dog')


#######################Test#########################
# describe "Pangram" do
#   it "Check if string is a Pangram" do
#     # "The quick brown fox jumps over the lazy dog."
#     expect(pangram?("The quick brown fox jumps over the lazy dog.")).to eq(true)
#     # "This is not a pangram."
#     expect(pangram?("This is not a pangram.")).to eq(false)
#   end
# end


####################Other solutions#######################3

  # def panagram?(string)
  #   string.downcase.scan(/[a-z]/).uniq.size == 26
  # end

  # def panagram?(s)
  #   ("A".."Z").to_a - s.upcase.chars == []
  # end

  # def panagram?(string)
  #   ([*?a..?z] - string.downcase.chars).empty?
  # end

  # def panagram?(s)
  #   (?a..?z).all?{|c|s[/#{c}/i]}
  # end

  # def panagram?(string)
  #   string.downcase!
  
  #   (?a..?z).all? { |l| string.include?(l) }
  # end