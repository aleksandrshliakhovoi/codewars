#https://www.codewars.com/kata/542f3d5fd002f86efc00081a/train/ruby

# Inspired by one of Uncle Bob's TDD Kata
# Write a function that generates factors for a given number.
# The function takes an integer on the standard input and returns a list of integers (ObjC: array of NSNumbers representing integers). That list contains the prime factors in numerical sequence.

#In number theory, integer factorization is the decomposition of a composite number into a product of smaller integers

# Test.assert_equals(prime_factors(1), [])
# Test.assert_equals(prime_factors(10), [2, 5])
# Test.assert_equals(prime_factors(8), [2, 2, 2])

def prime_factors(n)
  left = n
	factors = []

	2.upto(n) do |x|
    if left % x == 0 then 
      factors << x
      left /= x
      redo
    end
	end
  factors
end


# require 'prime'
# def prime_factors(n)
#   n.prime_division.flat_map { |prime, amt| [prime] * amt }
# end


# require 'prime'
# def prime_factors(n)
#   Prime.prime_division(n).flat_map { |f, p| [f] * p }
# end


# def prime_factors(n)
#   prime_factors = []

#   div = 2
#   while n != 1
#     if n % div == 0 
#       prime_factors << div
#       n /= div
#     else
#       div += 1
#     end
#   end

#   prime_factors
# end



# def prime_factors(n)
#   prime_factors = []

#   div = 2
#   while n != 1
#     if n % div == 0 && is_prime(div)
#       prime_factors << div
#       n /= div
#     else
#       div += 1
#     end
#   end

#   prime_factors
# end

# def is_prime(n)
#   (2..Math.sqrt(n)).none? { |d| n % d == 0 }
# end




# def prime_factors(n)
#   arr = []
#   recurse(n, arr)
# end
 
#  def recurse(n, arr)
#    if n == 1
#      return arr
#    end
#   (2..n).each do |i|
#      if n % i == 0
#        arr << i
#       return recurse(n / i, arr)
#      end
#    end
#  end

#  require 'prime'

# def prime_factors(n)
#   Prime.prime_division(n).reduce([]) { |acc, (x,y)|
#     y.times { acc << x }
#     acc
#   }
# end


# def prime_factors(n)
#   result = []
#   divs = 2
#   until n == 1 do
#     if n % divs == 0
#       n = n / divs
#       result << divs
#     else
#       divs += 1
#     end
#   end
#   result
# end


# def prime_factors(n)
#   require 'prime'
#   n.prime_division.map{|d, m| [d]*m}.flatten
# end