def one_and1439(int)
  hrs = sprintf("%02d", (int/2).divmod(30)[0])
  mins = sprintf("%-2d", int%60)
  "#{hrs}:#{mins}"
end

def grtr_than1439(int)
  int = int%1440
    hrs = sprintf("%02d", (int/2).divmod(30)[0])
  mins = sprintf("%d0", int%60)
  "#{hrs}:#{mins}"
end

def time_of_day(int)
  if int > 0 && int <= 1439
    one_and1439(int)
  elsif int > 1439
    grtr_than1439(int)
  else
    "00:00"
  end
end


# 720 mins in 12 hours

p time_of_day(0) == "00:00"
# time_of_day(-3) == "23:57"
p time_of_day(35) == "00:35"
# time_of_day(-1437) == "00:03"
p time_of_day(3000) == "02:00"
p time_of_day(800)  == "13:20"
p time_of_day(-4231) == "01:29"