# Complete the solution so that it splits the string into pairs of two characters. 
# If the string contains an odd number of characters then it should 
# replace the missing second character of the final pair with an underscore ('_').

def solution(str)
  if str.is_a?(String) && !str.empty?
    arr = str.chars.each_slice(2).map(&:join)

    if arr.last.size < 2
      arr[arr.size - 1] = arr.last + "_"
    end

    arr
  else
    str.split()
  end
end

p solution('abc') # should return ['ab', 'c_']
p solution('abcdef') # should return ['ab', 'cd', 'ef']

#better solutions

  # def solution str
  #   (str + '_').scan /../
  # end

  # def solution(str)
  #   str << "_" if str.length % 2 != 0
  #   str.chars.each_slice(2).map(&:join)
  # end

  # def solution(str)
  #   str.concat('_').scan /../
  # end

  # def solution(str)
  #   str << "_" if str.length.odd?
    
  #   arr = str.scan(/../)
  # end


  # def solution(str)
  #   (str << "_").scan(/\w{2}/)
  # end

  # def solution(str)
  #   arr = []
  #   idx = 0 
  #   while idx < str.length 
  #   arr.push(str[idx..idx+1])
  #   idx+=2
  #   end
  #    if str.length % 2 != 0
  #      arr.push(arr[-1]+'_')
  #      arr.delete_at(-2)
  #    end
  #   arr
  # end

  # def solution(str)
  #   str.chars.each_slice(2).map { |i| (i.length == 2 ? i : i << '_').join }
  # end