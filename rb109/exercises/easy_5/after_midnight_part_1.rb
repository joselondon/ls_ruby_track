# def one_and1439(int)
#   hrs = sprintf("%02d", (int/2).divmod(30)[0])
#   mins = sprintf("%002d", int%60)
#   "#{hrs}:#{mins}"
# end
# 
# def grtr_than1439(int)
#   int = int%1440
#     hrs = sprintf("%02d", (int/2).divmod(30)[0])
#   mins = sprintf("%002d", int%60)
#   "#{hrs}:#{mins}"
# end
# 
# def time_of_day(int)
#   if int > 0 && int <= 1439
#     one_and1439(int)
#   elsif int > 1439 || int < 0
#     grtr_than1439(int)
#   else
#     "00:00"
#   end
# end


# Far more elegant solution below after I got my head around the math!

MINUTES_PER_HOUR = 60
HOURS_PER_DAY =24
MINUTES_PER_DAY = MINUTES_PER_HOUR * HOURS_PER_DAY

def convert_mins_to_one_day_mins(num)
  until num >= 0
    num += MINUTES_PER_DAY
  end

  num % MINUTES_PER_DAY
end

def time_of_day(num)
  converted_num = convert_mins_to_one_day_mins(num)
  hour, mins = converted_num.divmod(MINUTES_PER_HOUR)
  sprintf('%02d:%02d', hour, mins)
end

p time_of_day(-3) #== "23:57"
p time_of_day(0)  #== "00:00"
p time_of_day(35) # == "00:35"
p time_of_day(-1437) #== "00:03"
p time_of_day(3000)  #== "02:00"
p time_of_day(800)   #== "13:20"
p time_of_day(-4231) # == "01:29"
