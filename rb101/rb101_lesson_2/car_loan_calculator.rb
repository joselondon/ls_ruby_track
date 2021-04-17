require 'pry'
#principle = 10000
#apr = 0.18
#annual_duration = 5
#duration_months = annual_duration * 12
#monthly_int = apr / 12
#
#
#
#
#monthly_payment = principle * (monthly_int / (1 - (1 + monthly_int)**(-duration_months)))
#
#p monthly_payment
#p duration_months
#p monthly_int
#--------------------------------------------------------------------------------------------

# PSEUDO CODE
# given the loan amount, APR, and and loan duration in years
# caculate the monthly interest, loand duration in months, and the monthly payment

#STRUCTURED PSEUDO CODE

#START

# SET another_loan? = 'y'

# WHILE another_loan? == 'y'

  # GET "Enter the loan amount"
  # SET principle
  # GET "Enter the annual interest rate on the loan"
  # SET apr
  # GET "How many years is the loan for?"
  # SET duration_years

  # PRINT "Thank you - calculating..."

  # SET duration_months = duration_years * 12
  # SET monthly_int = apr / 12
  # SET monthly_payment = principle * (monthly_int / (1 - (1 + monthly_int)**(-duration_months)))

  # PRINT "Your monthy payment will be " + monthly_payment
  # PRIMT "Your loan will replayments will continue for " + duration_months
  # PRINT "your monthly interest rate will be " + monthly_int
  # GET "Do you want to check another loan? ('y' for yes)"
  # SET another_loan

# END

# END

another_loan = 'y'
  Kernel.puts("Welcome to the loan calculator.")

while another_loan == 'y'
  Kernel.puts("Please enter the loan amount:")
  principle = Kernel.gets().chomp()
  
  Kernel.puts("Thank you, now enter the annual interest rate on the loan:")
  apr = Kernel.gets().chomp().to_f / 100

  Kernel.puts("Now please enter the loan duration in years:")
  duration_years = Kernel.gets().chomp()

  Kernel.puts("Thank you, calculating you loan details...")

  duration_months = duration_years.to_i * 12
  monthly_int = (apr / 12)
  monthly_payment = principle.to_i * (monthly_int / (1 - (1 + monthly_int)**(-duration_months)))

  Kernel.puts("Your monthy payment will be " + monthly_payment.to_s)
  Kernel.puts("Your loan will repayments will continue for " + duration_months.to_s + " months")
  Kernel.puts("your monthly interest rate will be " + monthly_int.to_s + "%")

  Kernel.puts("Do you want to check another loan? ('y' for yes)")
  another_loan = Kernel.gets().chomp()
end

Kernel.puts("Thank you for using the loan calculator.  Goodbye!")

