def color_valid(color)
  if color == "blue" || color == "green"
    true
  else
    false
  end
end


def color_valid_2(color)
  color == "blue" || color == "green"
end

p color_valid_2('yellow')
p color_valid_2("blue")
p color_valid_2("green")
