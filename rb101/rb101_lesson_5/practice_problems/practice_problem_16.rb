# A UUID is a type of identifier often used as a way to uniquely 
# identify items...which may not all be created by the same system. 
# That is, without any form of synchronization, two or more separate 
# computer systems can create new items and label them with a UUID with 
# gnificant chance of stepping on each other's toes.
# 
# It accomplishes this feat through massive randomization. The number 
# of possible UUID values is approximately 3.4 X 10E38.
# 
# Each UUID consists of 32 hexadecimal characters, and is typically 
# broken into 5 sections like this 8-4-4-4-12 and represented as a 
# string.
# 
# It looks like this: "f65c57f6-a6aa-17a8-faa1-a67f2dc9fa91"
# 
# Write a method that returns one UUID when called with no parameters.

# input:  none
# output:  a string containg 5 groupslower case alphanumeric characters of
#          lengths 8, 4, 4, 4, 12 separated by '-' 

# 1.  randomly generate a lowercase alphanumeric character and add it to
#     a new string
# 2.  REPEAT step 1 until 8 characters are generated
# 3.  REPEAT steps 1 and 2 above for each of the other groups of characters
# 4.  Join the separate strings together using '-' as a separator
# 5. Print the returned string to the user.

AN = [('a'..'f'), ('0'..'9')].map(&:to_a).flatten

def gen_eight
  (1..8).map { AN[rand(15)] }.join
end

def gen_four
  (1..4).map { AN[rand(15)] }.join
end

def gen_twelve
  (1..12).map { AN[rand(15)] }.join
end

def generate_hex
  string = "#{gen_eight}-#{gen_four}-#{gen_four}-#{gen_four}-#{gen_twelve}"
end

p generate_hex