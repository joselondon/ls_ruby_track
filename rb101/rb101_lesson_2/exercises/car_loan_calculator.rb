require 'yaml'
MESSAGES = YAML.load_file('car_loan_calculator_messages.yml')
LANGUAGE = 'en'
REGEX_STRING_REAL_NUMS_GREATER_THAN_ZERO = /\A[1-9]\d*$\Z/
VALID_YES = ['y', 'yes']
VALID_NO = ['n', 'no']

def messages(message, lang='en')
  MESSAGES[lang][message]
end

def prompt(key, var1=nil, var2=nil)
  message = messages(key, LANGUAGE)
  puts("=> #{message}#{var1}#{var2}")
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

def valid_quit_options(input)
  if VALID_YES.include?(input) || VALID_NO.include?(input)
    true
  else
    false
  end
end

prompt('welcome')

loop do
  timer
  clear_console
  principle = nil
  prompt('principle')
  loop do
    principle = gets.chomp
    if valid_number(principle)
      break
    else
      prompt('valid_number')
    end
  end

  apr_integer = nil
  apr_decimal = nil
  prompt('apr')
  loop do
    apr = gets.chomp.to_f
    if valid_number(apr)
      apr_decimal = apr.to_f / 100
      apr_integer = apr
      break
    else
      prompt('valid_number')
    end
  end

  duration_years = nil
  prompt('duration')
  loop do
    duration_years = gets.chomp
    if whole_years_input_validation(duration_years)
      break
    else
      prompt('valid_years')
    end
  end

  prompt('calculating')
  
  timer

  duration_months = duration_years.to_i * 12
  monthly_int = (apr_decimal / 12)
  monthly_percentage = (apr_integer /12)
  monthly_payment = principle.to_i *
                    (monthly_int / (1 - (1 + monthly_int)**(-duration_months)))

  prompt('monthly_payment', monthly_payment.round(2).to_s)
  prompt('months', duration_months, " months")
  prompt('monthly_int', monthly_percentage.round(4), "%")

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

  VALID_NO.include?(another_loan) ? break : next
end

prompt('goodbye')