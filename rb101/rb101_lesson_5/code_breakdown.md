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
| 1-5 | Block execution | Sub-hash | None | `true` | Yes, used by `select` |
| 2 | Method call `all?` | Each sub-hash | None | Boolean value | Yes, used by `select` |
| 2-5 | block execution | Each sub-hash | None | Boolean value | Yes, used by `all?` |
| 3 | == comparison operator | Element 0 of the each hash value of each sub-array|  None | Boolean | Yes, used by `all` |