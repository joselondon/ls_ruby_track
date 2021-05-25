require 'pry'
def factors(number)
  binding.pry
  loop do 
    if (number.is_a?(Integer)) && (number > 0)
      break
    else
    p "Incorrect float will be rounded down"
    number = gets.chomp.strip.to_i
    end
  end
  divisor = number
  factors = []
  begin
    factors << number / divisor if number % divisor == 0
    divisor -= 1
  end until divisor == 0
  factors
end

p factors(0)

