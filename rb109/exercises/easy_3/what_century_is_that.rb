def century(year)
  century = ((year - 1) / 100 + 1)
  century.to_s + suffix(century)
end

def suffix(century)
  tens = century % 100
  units = century % 10
  suffix_exceptions = [11, 12, 13]

  return 'th' if suffix_exceptions.include?(tens)
  
  case units
  when 1 then 'st'
  when 2 then 'nd'
  when 3 then 'rd'
  else 'th'
  end
end

p century(2000) == '20th'
p century(2001) == '21st'
p century(1965) == '20th'
p century(256) == '3rd'
p century(5) == '1st'
p century(10103) == '102nd'
p century(1052) == '11th'
p century(1127) == '12th'
p century(11201) == '113th'