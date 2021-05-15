require 'yaml'
require 'pry'
MESSAGES = YAML.load_file('car_loan_calculator_messages.yml')
LANGUAGE = 'en'
REGEX_STRING_REAL_NUMS_GREATER_THAN_ZERO = /\A[1-9]\d*$\Z/
VALID_YES = ['y', 'yes']
VALID_NO = ['n', 'no']

def generic_input_capture_validation(prompt, validator,
                      validation_error_message, func1=nil, func2=true)
  value = func1
  prompt(prompt)
  loop do
    value = gets.chomp
    if method(validator).call(value) == func2
      return value
    else
      prompt(validation_error_message)
    end
  end
end

def messages(message, lang='en')
  MESSAGES[lang][message]
end

def prompt(key, var1=nil, var2=nil)
  message = messages(key, LANGUAGE)
  puts("=> #{message}#{var1}#{var2}")
end

def valid_quit_options(input)
  if VALID_YES.include?(input) || VALID_NO.include?(input)
    true
  else
    false
  end
end

def valid_number(num)
  num.to_i > 0
end

def whole_years_input_validation(num)
  !!REGEX_STRING_REAL_NUMS_GREATER_THAN_ZERO.match(num)
end

def clear_console
  system('clear')
  system('cls')
end

def timer
  sleep(1)
  puts('-')
  sleep(1)
  puts('-')
  sleep(1)
  puts('-')
end

def get_loan_amount
  generic_input_capture_validation('principle', :valid_number,
                                   'valid_number')
end

def get_loan_interest
  generic_input_capture_validation('apr', :valid_number,
                                  'valid_number')
end

def get_loan_duration
  generic_input_capture_validation('duration',
                                   :whole_years_input_validation,
                                   'valid_years')
end

def another_calculation?
  another_loan = ''
  prompt('again?')
  loop do
    another_loan = gets.downcase.chomp
    if valid_quit_options(another_loan) == false
      prompt('valid_quit')
    else
      break
    end
  end
  VALID_NO.include?(another_loan)
end

def end_program?
  another_calculation?
end

def display_welcome_message
  prompt('welcome')
end

def display_calculating_message
  prompt('calculating')
end

def display_goodbye
  prompt('goodbye')
end

def display_output(monthly_amount, months, monthly_percent)
  prompt('monthly_payment', monthly_amount.round(2).to_s)
  prompt('months', months, " months")
  prompt('monthly_int', monthly_percent.round(4), "%")
end

def calulate_duration_months(years)
  years.to_i * 12
end

def calculate_monthly_int(annual_int)
  annual_int / 12
end

def calculate_monthly_percentage(annual_int)
  annual_int * 100 / 12
end

def calculate_monthly_amount(amount, monthly, months)
  amount.to_i *
    (monthly / (1 - (1 + monthly)**(-months)))
end

display_welcome_message

principle = ''
apr_decimal = ''
duration_years = ''

loop do
  timer
  clear_console
  principle = get_loan_amount
  apr_decimal = get_loan_interest.to_f / 100
  duration_years = get_loan_duration
  display_calculating_message

  timer

  duration_months = calulate_duration_months(duration_years)
  monthly_int = calculate_monthly_int(apr_decimal)
  monthly_percentage = calculate_monthly_percentage(apr_decimal)
  monthly_payment = calculate_monthly_amount(principle, monthly_int,
                                             duration_months)

  display_output(monthly_payment, duration_months, monthly_percentage)

  end_program? ? break : next
end

display_goodbye
