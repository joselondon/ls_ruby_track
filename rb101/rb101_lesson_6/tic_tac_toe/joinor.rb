def joinor(arr, final='or')
  str = ""
  arr.each do |element|
    if element != arr.last
      str << "#{element}, "
    else
      str << "#{final} #{element}"
    end
  end
  str
end

array = [1, 2, 3]

p joinor(array, 'and')