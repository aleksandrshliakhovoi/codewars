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
