require 'pry'
def factors(number)
  divisor = number
  factors = []
  while divisor > 0 do
    factors << number / divisor if number % divisor == 0
    divisor -= 1
  end
  factors
end


p factors(4)

p factors(0)

# Bonus 1
# The purpose of number % divisor == 0 ?
# is to ensure that the incrementally decreasing divsor divides evenly into 
# the original number supplied.   Factors of number must devide evenly with
# no modulus ie modulus (%) of the division operation should == 0

# Bonus 2
# Ensures factors() RETURNS factors Array which has now be populated with 
# the factors of the number variable by the loop on lines 4 to
