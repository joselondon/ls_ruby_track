# PROBLEM:
# Write a program that will ask for user's name. The program will then greet the user. If the user writes "name!" 
# then the computer yells back to the user.

# EXAMPLES
# -1 What is your name? Bob
# Hello Bob.
# 
# -2 What is your name? Bob!
# HELLO BOB. WHY ARE WE SCREAMING?

# ALGORITHM
# Inputs: String
# Outputs: String
# 
# 1.  Prompt user for a [name]
# 2.  If [NAME] ends with a '!' character return with CAPS message
# 3.  Otherwise return a message in regular case test

def greeting_user
  puts "What is your name?"
  name = gets.chomp
  if name.end_with?('!')
    name.chop!
    puts "HELLO #{name.upcase}. WHY ARE WE SCREAMING?"
  else
    puts "Hello #{name}."
  end
end

greeting_user()
