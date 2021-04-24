require 'pry'
VALID_CHOICES = ['rock', 'paper', 'scissors', 'spock', 'lizard']

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
    prompt("Choose one: #{VALID_CHOICES.join(', ')}")
    choice = Kernel.gets().chomp().to_sym

    if VALID_CHOICES.include?(choice.to_s)
      break
    else
      prompt("That's not a valid choice.")
    end
  end

  computer_choice = VALID_CHOICES.sample().to_sym

  prompt("You chose: #{choice.to_s}; Computer chose: #{computer_choice.to_s}")
  display_results(choice, computer_choice)

  prompt('Do you want to play again?')
  answer = Kernel.gets().downcase().chomp()
  break unless answer.start_with?('y')
end

prompt("Thank you for playing.  Goodbye!")
