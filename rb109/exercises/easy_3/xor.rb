def xor?(state1, state2)
  if state1 == true && state2 == true
    false
  elsif state1 == false && state2 == false
    false
  else
    true
  end
end

p xor?(5.even?, 4.even?) == true
p xor?(5.odd?, 4.odd?) == true
p xor?(5.odd?, 4.even?) == false
p xor?(5.even?, 4.odd?) == false

# prefer the following solution on LS
def better_xor?(value1, value2)
  return true if value1 && !value2
  return true if value2 && !value1
  false
end