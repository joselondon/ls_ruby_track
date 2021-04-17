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




