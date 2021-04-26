require 'pry'
VALID_CHOICES = ['rock', 'paper', 'scissors', 'spock', 'lizard']
VALID_CHOICES_ABBR = ['r', 'p', 's', 'l']

def prompt(message)
  Kernel.puts(">> #{message}")
end

PLAYER_MOVE_LOGIC = {
  rock:     {
    rock:     'tie',
    paper:    false,
    scissors: true,
    spock:    false,
    lizard:   true
  },
  paper:    {
    rock:     true,
    paper:    'tie',
    scissors: false,
    spock:    true,
    lizard:   false
  },
  scissors: {
    rock:     false,
    paper:    true,
    scissors: 'tie',
    spock:    false,
    lizard:   true
  },
  spock: {
    rock:     true,
    paper:    false,
    scissors: true,
    spock:    'tie',
    lizard:   false
  },
  lizard: {
    rock:     false,
    paper:    true,
    scissors: false,
    spock:    true,
    lizard:   'tie'
  }
}

ABBREVIATION_MAPPER = {
  r: :rock,
  p: :paper,
  s: :scissors,
  l: :lizard
}

def convert_abbr_to_hash_val(abbrev)
  ABBREVIATION_MAPPER.each do |key, val|
    if abbrev.to_sym == key
      abbrev = ABBREVIATION_MAPPER[abbrev]
      binding.pry
      return abbrev
    end
  end
end


def valid_input?(str)
  if VALID_CHOICES.include?(str.to_s)
    true
  elsif str == :sp
    convert_abbr_to_hash_val(str)
    true
  elsif VALID_CHOICES_ABBR.include?(str.to_s)
    true
   else
    prompt("That's not a valid choice.")
  end
end


def win?(first, second)
  PLAYER_MOVE_LOGIC[first][second]
end

def display_results(player, computer)
  if win?(player, computer) == 'tie'
    puts "its a tie"
  elsif win?(player, computer)
    puts "you win"
  else
    puts "you lose"
  end  
end

loop do
  choice = ''
  loop do

    prompt("Choose one: #{VALID_CHOICES.join(', ')}, 
    you can just type the first letter (or 'sp' for 'spock')")

    choice = Kernel.gets().chomp().to_sym
    break if valid_input?(choice)
  end
  
  choice = ABBREVIATION_MAPPER[choice]
  computer_choice = VALID_CHOICES.sample().to_sym
  binding.pry

  prompt("You chose: #{choice.to_s}; Computer chose: #{computer_choice.to_s}")
  display_results(choice, computer_choice)

  prompt('Do you want to play again?')
  answer = Kernel.gets().downcase().chomp()
  break unless answer.start_with?('y')
end

prompt("Thank you for playing.  Goodbye!")
