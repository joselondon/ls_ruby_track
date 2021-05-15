require 'pry'

def first_option(adds)
  puts "space jam" + adds
end

def second_option
  puts "dogs rule"
end

def receives_function(func, param)
  method(func).call(param)
end

receives_function(:first_option, " yum")