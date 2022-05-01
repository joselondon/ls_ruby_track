# Practice Problem 14

# Given this data structure write some code to return an array containing the colors of the fruits
# and the sizes of the vegetables. The sizes should be uppercase and the colors should be capitalized.

hsh = {
  'grape' => {type: 'fruit', colors: ['red', 'green'], size: 'small'},
  'carrot' => {type: 'vegetable', colors: ['orange'], size: 'medium'},
  'apple' => {type: 'fruit', colors: ['red', 'green'], size: 'medium'},
  'apricot' => {type: 'fruit', colors: ['orange'], size: 'medium'},
  'marrow' => {type: 'vegetable', colors: ['green'], size: 'large'},
}

# expected result:  [["Red", "Green"], "MEDIUM", ["Red", "Green"], ["Orange"], "LARGE"]

array = []
hsh.each_pair do |name, value|
  case value[:type]
  when 'fruit'
      array << value[:colors].map {|color| color.capitalize}
  when 'vegetable'
      array << value[:size].upcase
  end
end

p array