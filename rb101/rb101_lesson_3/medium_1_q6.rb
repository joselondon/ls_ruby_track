answer = 42

def mess_with_it(some_number)
  some_number += 8
end

new_answer = mess_with_it(answer)

p answer - 8

# =>  new_answer = 42 (50 - 8)
# => answer is not mutated by re-assignment and so remians 42. 
# => p answer - 8 therefore outputs 42 - 8 = 34