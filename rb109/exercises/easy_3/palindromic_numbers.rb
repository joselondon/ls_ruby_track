def palindromic_number?(num)
  num.digits.reverse == num.digits
end

p palindromic_number?(34543) == true
p palindromic_number?(123210) == false
p palindromic_number?(22) == true
p palindromic_number?(5) == true
p palindromic_number?(0220) == true
p palindromic_number?(005) == false