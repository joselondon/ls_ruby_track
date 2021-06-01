require 'pry'
def fun_with_ids
  a_outer = 42          # integer - non-mutable object
  b_outer = "forty two" # string - mutable object
  c_outer = [42]        # array - mutable 
  d_outer = c_outer[0]  # array element -potentially mutable - not in this case as its an integer

  a_outer_id = a_outer.object_id  # id 17
  b_outer_id = b_outer.object_id  # is 23
  c_outer_id = c_outer.object_id  # id 50
  d_outer_id = d_outer.object_id  # id 17

  puts "a_outer is #{a_outer} with an id of: #{a_outer_id} before the block." #17
  puts "b_outer is #{b_outer} with an id of: #{b_outer_id} before the block." #23
  puts "c_outer is #{c_outer} with an id of: #{c_outer_id} before the block." #50
  puts "d_outer is #{d_outer} with an id of: #{d_outer_id} before the block." #17
  puts

  1.times do
    a_outer_inner_id = a_outer.object_id  # a_outer_inner_id = 17
    b_outer_inner_id = b_outer.object_id  # b_outer_inner_id = 23
    c_outer_inner_id = c_outer.object_id  # c_outer_inner_id = 50
    d_outer_inner_id = d_outer.object_id  # c_outer_inner_id = 17

    puts "a_outer id was #{a_outer_id} before the block and is: #{a_outer_inner_id} inside the block." # same 17
    puts "b_outer id was #{b_outer_id} before the block and is: #{b_outer_inner_id} inside the block." # same 23
    puts "c_outer id was #{c_outer_id} before the block and is: #{c_outer_inner_id} inside the block." # same 50
    puts "d_outer id was #{d_outer_id} before the block and is: #{d_outer_inner_id} inside the block." # same 17
    puts

    a_outer = 22 # new id - 18
    b_outer = "thirty three" # - new  id 223
    c_outer = [44] #  id 500
    d_outer = c_outer[0] # new id 20
 
    puts "a_outer inside after reassignment is #{a_outer} with an id of: #{a_outer_id} before and: #{a_outer.object_id} after." # was 17 now 18
    puts "b_outer inside after reassignment is #{b_outer} with an id of: #{b_outer_id} before and: #{b_outer.object_id} after." # as 23 no 223
    puts "c_outer inside after reassignment is #{c_outer} with an id of: #{c_outer_id} before and: #{c_outer.object_id} after." # was 50 now 500
    puts "d_outer inside after reassignment is #{d_outer} with an id of: #{d_outer_id} before and: #{d_outer.object_id} after." # was 17 now 20
    puts


    a_inner = a_outer # 22 id 18
    b_inner = b_outer # "thirty three" id 223
    c_inner = c_outer # [44] id 500
    d_inner = c_inner[0] # 44 id 20

    a_inner_id = a_inner.object_id
    b_inner_id = b_inner.object_id
    c_inner_id = c_inner.object_id
    d_inner_id = d_inner.object_id

    puts "a_inner is #{a_inner} with an id of: #{a_inner_id} inside the block (compared to #{a_outer.object_id} for outer)."# same
    puts "b_inner is #{b_inner} with an id of: #{b_inner_id} inside the block (compared to #{b_outer.object_id} for outer)." # same
    puts "c_inner is #{c_inner} with an id of: #{c_inner_id} inside the block (compared to #{c_outer.object_id} for outer)." # same
    puts "d_inner is #{d_inner} with an id of: #{d_inner_id} inside the block (compared to #{d_outer.object_id} for outer)." # same
    puts 
  end
  puts "a_outer is #{a_outer} with an id of: #{a_outer_id} BEFORE and: #{a_outer.object_id} AFTER the block." # new object ids are retained
  puts "b_outer is #{b_outer} with an id of: #{b_outer_id} BEFORE and: #{b_outer.object_id} AFTER the block." 
  puts "c_outer is #{c_outer} with an id of: #{c_outer_id} BEFORE and: #{c_outer.object_id} AFTER the block." 
  puts "d_outer is #{d_outer} with an id of: #{d_outer_id} BEFORE and: #{d_outer.object_id} AFTER the block." 
  puts

  puts "a_inner is #{a_inner} with an id of: #{a_inner_id} INSIDE and: #{a_inner.object_id} AFTER the block." rescue puts "ugh ohhhhh"
  puts "b_inner is #{b_inner} with an id of: #{b_inner_id} INSIDE and: #{b_inner.object_id} AFTER the block." rescue puts "ugh ohhhhh"
  puts "c_inner is #{c_inner} with an id of: #{c_inner_id} INSIDE and: #{c_inner.object_id} AFTER the block." rescue puts "ugh ohhhhh"
  puts "d_inner is #{d_inner} with an id of: #{d_inner_id} INSIDE and: #{d_inner.object_id} AFTER the block." rescue puts "ugh ohhhhh"
end

fun_with_ids()