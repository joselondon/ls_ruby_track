# in the array:

flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)

# Find the index of the first name that starts with "Be"

be = flintstones.select do |flintstone|
  flintstone.start_with?("Be")
end

p be