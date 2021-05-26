# easy 2

# q1

ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 402, "Eddie" => 10 }

ages.include?("Spot") # will return true or false
ages.key?("Spot") # =>  true or false
ages.has_key?("Spot") # =>  true or false
ages.member?("Spot"() # =>  true or false

# less useful
ages.assoc("Spot")  # will return nil if key does not exist
ages.dig("Spot") # will return nil if key not available, or value if it is

# ------------------------------------------------------------------------

# q2

munsters_description = "The Munsters are creepy in a good way."
munsters_description.swapcase!    # "tHE mUNSTERS ARE CREEPY IN A GOOD WAY."

munsters_description = "The Munsters are creepy in a good way."
munsters_description.capitalize!  # "The munsters are creepy in a good way."

munsters_description = "The Munsters are creepy in a good way."
munsters_description.downcase!    # "the munsters are creepy in a good way."

munsters_description = "The Munsters are creepy in a good way."
munsters_description.upcase!      # "THE MUNSTERS ARE CREEPY IN A GOOD WAY."

# --------------------------------------------------------------------------

# q3

additional_ages = { "Marilyn" => 22, "Spot" => 237 }

ages.merge!(additional_ages)

#----------------------------------------------------------------------------

# q4

advice = "Few things in life are as important as house training your pet dinosaur."

advice.include?("Dino") # => false

#----------------------------------------------------------------------------

# q5

flintstones = ["Fred", "Barney", "Wilma", "Betty", "BamBam", "Pebbles"]

flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)
#------------------------------------------------------------------------------

# q6

flintstones << "Dino"
#-------------------------------------------------------------------------------

# q7
flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)
flintstones.push("Dino", "Hoppy")

flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)
flintstones.concat(%w(Dino Hoppy))
#---------------------------------------------------------------------------------

# q8
advice = "Few things in life are as important as house training your pet dinosaur."
advice.slice!(0..38)

# q8 bonus
advice.slice(0..38) # will still return "Few things in life are as important as "
                    # but `advice` variable will remain unaltered
#-----------------------------------------------------------------------------------

# q9
statement = "The Flintstones Rock!"
statement.count('t')
#-----------------------------------------------------------------------------------

# q10
title = "Flintstone Family Members"
title.center(40)