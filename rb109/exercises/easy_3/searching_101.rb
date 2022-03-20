def get_nums
  question = ['1st', '2nd', '3rd', '4th', '5th', 'last']
  answers = []
  question.each do |position|
    puts "==> Enter the #{position} number:"
    answers << gets.chomp.to_i
  end
  answers
end

def search(array)
  if array[0..4].include?(array[5])
    "The number #{array[5]} appears in #{array[0..4]}."
  else
    "The number #{array[5]} does not appear in #{array[0..4]}."
  end
end

puts search(get_nums)