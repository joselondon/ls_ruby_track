# Practice Problem 6

# One of the most frequently used real-world string properties is that of "string substitution",
# where we take a hard-coded string and modify it with various parameters from our program.

# Given this previously seen family hash, print out the name, age and gender of each family member:

munsters = {
  "Herman" => { "age" => 32, "gender" => "male" },
  "Lily" => { "age" => 30, "gender" => "female" },
  "Grandpa" => { "age" => 402, "gender" => "male" },
  "Eddie" => { "age" => 10, "gender" => "male" },
  "Marilyn" => { "age" => 23, "gender" => "female"}
}

# ...like this:

# => (Name) is a (age)-year-old (male or female).

munsters.each do |family|
  puts "#{family[0]} is  a #{family[1]["age"]}-year old #{family[1]["gender"]}."
end

