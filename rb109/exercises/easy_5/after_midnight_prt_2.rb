MINS_PER_HOUR = 60
MINS_PER_DAY = 1440
MIDNGHT_MINUTES = 0

def hrs_mins(time)
  hours, mins = time.split(':').map(&:to_i)
  {hours: hours, minutes: mins}
end

def calc_mins(time)
  ints= hrs_mins(time)
  minutes = ints[:hours] * MINS_PER_HOUR + ints[:minutes]
end

def after_midnight(time)
  minutes = calc_mins(time)
  minutes < MINS_PER_DAY ? MIDNGHT_MINUTES + minutes : 0
end

def before_midnight(time)
  minutes = calc_mins(time)
  minutes == 0 ? 0 : MINS_PER_DAY - minutes.abs
end

p after_midnight('00:00') == 0
p before_midnight('00:00') == 0
p after_midnight('12:34') == 754
p before_midnight('12:34') == 686
p after_midnight('24:00')  == 0
p before_midnight('24:00') == 0