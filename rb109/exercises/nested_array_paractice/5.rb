# Given this nested Hash:

munsters = {
  "Herman" => { "age" => 32, "gender" => "male" },
  "Lily" => { "age" => 30, "gender" => "female" },
  "Grandpa" => { "age" => 402, "gender" => "male" },
  "Eddie" => { "age" => 10, "gender" => "male" },
  "Marilyn" => { "age" => 23, "gender" => "female"}
}

# figure out the total age of just the male members of the family.
summmed_male_age = 0
munsters.each do |munster|
  munster.each do |stat|
    summmed_male_age += stat['age'] if stat['gender'] == 'male'
  end
end
puts summmed_male_age

