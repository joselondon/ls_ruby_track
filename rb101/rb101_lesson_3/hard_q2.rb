greetings = { a: 'hi' }
informal_greeting = greetings[:a]
informal_greeting << ' there'

puts informal_greeting  #  => "hi there"
puts greetings # => { a: 'hi there' }

# greetings points to an array 
# informal_greeting is set to point at the string object "hi" - the first value of greeting
# String#<< mutatates its caller.  So informal_greeting << ' there' mutates the first element of greetings 
#  because it is the same object referenced by informal_greeting

