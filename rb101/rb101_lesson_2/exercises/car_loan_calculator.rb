require 'pry'
require 'yaml'
MESSAGES = YAML.load_file('car_loan_calculator_messages.yml')
LANGUAGE = 'en'

def messages(message, lang='en')
  MESSAGES[lang][message]
end

def prompt(key, var1=nil, var2=nil)
  message = messages(key, LANGUAGE)
  Kernel.puts("=> #{message}#{var1}#{var2}")
end

def valid_number(num)
  num.to_i() > 0
end

another_loan = 'y'
prompt('welcome')

while another_loan == 'y'
  principle = nil
  prompt('principle')
  loop do
    principle = Kernel.gets().chomp()
    if valid_number(principle)
      break
    else
      prompt('valid_number')
    end
  end
  apr = nil
  prompt('apr')
  loop do
    apr = Kernel.gets().chomp()
    if valid_number(apr)
      apr = apr.to_f / 100
      break
    else
      prompt('valid_number')
    end
  end

  duration_years = nil
  prompt('duration')
  loop do
    duration_years = Kernel.gets().chomp()
    if valid_number(duration_years)
      break
    else
      prompt('valid_number')
    end
  end

  prompt('calculating')

  duration_months = duration_years.to_i * 12
  monthly_int = (apr / 12)
  monthly_payment = principle.to_i *
                    (monthly_int / (1 - (1 + monthly_int)**(-duration_months)))

  prompt('monthly_payment', monthly_payment.round(2).to_s)
  prompt('months', duration_months, " months")
  prompt('monthly_int', monthly_int.round(4), "%")

  prompt('again?')
  another_loan = Kernel.gets().downcase().chomp()
end

prompt('goodbye')
