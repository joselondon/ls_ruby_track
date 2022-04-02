def multiple_of_3_or_5?(int)
  arr = []
  (1..int).select do |i|
     (i % 3 == 0) || (i % 5 == 0)
  end
end

def multisum(int)
  multiple_of_3_or_5?(int).sum
end

p multisum(3) == 3
p multisum(5) == 8
p multisum(10) == 33
p multisum(1000) == 234168