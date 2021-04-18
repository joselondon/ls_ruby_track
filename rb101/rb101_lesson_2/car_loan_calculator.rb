require 'pry'

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

def prompt(message)
  Kernel.puts(">> #{message}")
end

another_loan = 'y'
  prompt("Welcome to the loan calculator.")

while another_loan == 'y'
  prompt("Please enter the loan amount:")
  principle = Kernel.gets().chomp()
  
  prompt("Thank you, now enter the annual interest rate on the loan:")
  apr = Kernel.gets().chomp().to_f / 100

  prompt("Now please enter the loan duration in years:")
  duration_years = Kernel.gets().chomp()

  prompt("Thank you, calculating you loan details...")

  duration_months = duration_years.to_i * 12
  monthly_int = (apr / 12)
  monthly_payment = principle.to_i * (monthly_int / (1 - (1 + monthly_int)**(-duration_months)))

  prompt("Your monthy payment will be: £" + monthly_payment.round(2).to_s)
  prompt("Your loan will repayments will continue for " + duration_months.to_s + " months")
  prompt("your monthly interest rate will be " + monthly_int.round(4).to_s + "%")

  prompt("Do you want to check another loan? ('y' for yes)")
  another_loan = Kernel.gets().chomp()
end

prompt("Thank you for using the loan calculator.  Goodbye!")

