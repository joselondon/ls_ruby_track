# PROBLEM
# Create a simple tip calculator. The program should prompt for a 
# bill amount and a tip rate. The program must compute the tip and
# then display both the tip and the total amount of the bill.

# ALGORITHM
# inputs:   float, integer
# outputs:  string, float
# 1. run program
# 2. program prompts user for a bill_amount float
# 3. (implied) program should accept floats
# 4. program should prompt for a tip rate integer
# 5. compute tip = bill_amount * (tip_rate / 100)
# 6. compute total = tip + amount
# 7. Display tip and total to user as currency format (2 dcimal places)

# EXAMPLE:
# What is the bill? 200
# What is the tip percentage? 15
# 
# The tip is $30.00
# The total is $230.00

def tip_calculator
  puts "What is the bill?"
  bill_amount = gets.to_f.round(2)

  puts "What is the tip percentage?"
  tip_percentage = gets.to_f / 100

  tip = bill_amount * tip_percentage
  total = bill_amount + tip

  puts
  puts "The tip is $#{sprintf("%.2f", tip)}"
  puts "The total is $#{sprintf("%.2f", total)}"
end

tip_calculator()