# PROBLEM:
# Build a program that displays when the user will retire and how 
# many years she has to work till retirement.

# EXAMPLE:
# What is your age? 30
# At what age would you like to retire? 70
# 
# It's 2016. You will retire in 2056.
# You have only 40 years of work to go!

# ALGORITHM:
# Inputs: integers (current_age, retirment_age)
# Outputs: Integer (current_year, years_to_go)
# 
# 1. Prompt user for age - store as integer variable 
# 2. Prompt user for retirement age, store as integer variable
# 3. Retrieve current year and store as variable
# 4. Calculate years_to_go = retirement_age - current_age
# 5. Calculate retirment year = current_year + years_to_go
# 6. Display message with current_year, retirement_year and and 
# years_to_go

def retirement_age
  puts "What is your age?"
  current_age = gets.to_i
  puts "At what age would you like to retire?"
  retirement_age = gets.to_i
  puts

  current_year = Time.now.year
  years_to_go = retirement_age - current_age
  retirement_year = current_year + years_to_go

  puts "Its #{current_year}. You will retire in #{retirement_year}."
  puts "You only have #{years_to_go} years of work to go!"
end

retirement_age()
