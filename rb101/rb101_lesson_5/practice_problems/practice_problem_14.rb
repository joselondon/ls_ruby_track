# Given this data structure write some code to return an array 
# containing the colors of the fruits and the sizes of the vegetables. 
# The sizes should be uppercase and the colors should be capitalized.

hsh = {
  'grape' => {type: 'fruit', colors: ['red', 'green'], size: 'small'},
  'carrot' => {type: 'vegetable', colors: ['orange'], size: 'medium'},
  'apple' => {type: 'fruit', colors: ['red', 'green'], size: 'medium'},
  'apricot' => {type: 'fruit', colors: ['orange'], size: 'medium'},
  'marrow' => {type: 'vegetable', colors: ['green'], size: 'large'},
}

new_array = hsh.map do |_, stats|
  if stats[:type] == 'fruit'
    stats[:colors].map do |color|
      color.capitalize
    end
  elsif stats[:type] == 'vegetable'
    stats[:size].upcase
  end
end
 
p new_array
puts
p hsh