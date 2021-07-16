# In the a has:

ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 402, "Eddie" => 10 }

# remove people with age 100 and greater 

ages.delete_if { |munster, age| age >= 100 } 

p ages


# OR

ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 402, "Eddie" => 10 }

ages.select do |munster, age|
  ages.delete(munster) if age >= 100
end
# 
p ages
