```ruby
[{ a: 'ant', b: 'elephant' }, { c: 'cat' }].select do |hash|
  hash.all? do |key, value|
    value[0] == key.to_s
  end
end
# => [{ :c => "cat" }]
```

| Line     | Action    | Object     |  Side Effect | Return Value | Is Return Value Used? |
|:--------------:|:------------:|:------------:|:------------:|:------------:|:-----------:|
| 1 | Method call `select` | Outer array | None | `[{ :c => "cat" }]` | No, but shown on line 6 |
| 2 | Method call `all?` | Each sub-hash | None | `false` | 
