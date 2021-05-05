```ruby
numbers = [1, 2, 2, 3]
numbers.uniq

puts numbers
```
[Ruby 3.0.0](https://ruby-doc.org/core-3.0.0/Array.html#method-i-uniq) : `Array#uniq` will return a new array idnetifying and omitting duplicate values.<br>

expected return: `[2]`

However `Array#uniq` is not destructive so `puts numbers` will print the original Array elements extracted from the Array (each on a new line):<br>
1<br>
2<br>
2<br>
3<br>
[Ruby Docs puts()](https://ruby-doc.org/core-3.0.0/IO.html#method-i-puts)


