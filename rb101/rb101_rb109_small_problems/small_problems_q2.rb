require 'date'

# without params Date#civil will return its default param as defined in the Ruby Standard Library: 
# https://ruby-doc.org/stdlib-3.0.1/libdoc/date/rdoc/Date.html     ie ([year=-4712[, month=1[, mday=1[, start=Date::ITALY]]]]) → date 
# Then the following statements will substitute a given parameter

puts Date.civil               # -4712-01-01
puts Date.civil(2016)         #  2016-01-01
puts Date.civil(2016, 5)      #  2016-05-01
puts Date.civil(2016, 5, 13)  #  2016-05-13