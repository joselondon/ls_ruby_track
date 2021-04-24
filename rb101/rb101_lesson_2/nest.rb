PLAYER = {
  rock:   {
    rock:     'tie',
    paper:    false,
    scissors: true,
    spock:    false,
    lizard:   true
  },
}



if PLAYER[:rock][:rock] == 'tie'
  puts "its a tie"
elsif PLAYER[:rock][:paper]
  puts "you win"
else
  puts "you lose"
end
