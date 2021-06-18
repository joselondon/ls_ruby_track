#inputs: 
#integer x 1
#string x 1

#outputs:
#strings

# 1. given two arguments, one string(str) and one integer(int)
# 2. print the string as many times as the integer
# 
# examples:
# repeat('Hello', 3)
# 
# outputs: -
# Hello
# Hello
# Hello

def repeat(str, int)
  int.times {puts str}
end

repeat('Hello', 3)
