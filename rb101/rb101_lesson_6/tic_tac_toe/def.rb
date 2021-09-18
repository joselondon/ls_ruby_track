brd = {1=>" ", 2=>" ", 3=>" ", 4=>" ", 5=>" ", 6=>" ", 7=>" ", 8=>"X", 9=>"X"}

brd.each do |k, v|
  if brd[k] == 'X' && brd[k + 1] == 'X'
    puts 'true'
  else
    puts 'false'
  end
end
