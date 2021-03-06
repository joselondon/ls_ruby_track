def greg_or_jul(year)
  year >= 1752 ? :greg : :jul
end

def gregorian_leap_year_calc(year)
  if (year % 100 == 0) && (year % 400 != 0)
    false
  elsif year % 4 == 0
    true
  else
    false
  end
end

def julian_leap_year_calc(year)
  year % 4 == 0 
end

def leap_year?(year)
  if greg_or_jul(year) == :greg
    gregorian_leap_year_calc(year)
  elsif greg_or_jul(year) == :jul
    julian_leap_year_calc(year)
  end
end

p leap_year?(2016) == true
p leap_year?(2015) == false
p leap_year?(2100) == false
p leap_year?(2400) == true
p leap_year?(240000) == true
p leap_year?(240001) == false
p leap_year?(2000) == true
p leap_year?(1900) == false
p leap_year?(1752) == true
p leap_year?(1700) == true
p leap_year?(1) == false
p leap_year?(100) == true
p leap_year?(400) == true