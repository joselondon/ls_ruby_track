principle = 10000
apr = 0.18
annual_duration = 5
duration_months = annual_duration * 12
monthly_int = apr / 12




monthly_payment = principle * (monthly_int / (1 - (1 + monthly_int)**(-duration_months)))

p monthly_payment
p duration_months
p monthly_int