```ruby
[[[1, 2], [3, 4]], [5, 6]].map do |arr|
  arr.map do |el|
    if el.to_s.size == 1    # it's an integer
      el + 1
    else                    # it's an array
      el.map do |n|
        n + 1
      end
    end
  end
end
# => [[2, 3], [4, 5]], [6, 7]]
```
| Line  | Action | Object | Side Effect | Return Value |Is Return Value Used?|
|:---:|:----:|:----:|:---------:|:----------:|:-----------:|
| 1 | method call (`map`) | outer array | [[[2, 3], [4, 5]], [6, 7]]  |  | No, but shown on line 12 |
| 1-11 | block execution 1 | sub-arrays  | Transforms each sub element | [[[2, 3], [4, 5]], [6, 7]] | Yes, used by `map` line 1 |
| 2 | Method call (`map`) | each sub-array | Tranforms each sub-element | [[2, 3], [4, 5]], [6, 7] | Used by `map` on line 1 |
| 2-10 | Block execution 2 | Each element within sub-arrays | Yes, transforms each element | element +1 | Yes. Used by `map` on line 2 |
| 3-9 | `if/else` statement | Element | Increments element by 1 if `Integer` or passed to next `map` on line 6 | 2, 3, 4, 5 or `false` | Yes.  Used by `map` on line 2 and line 6 |
| 7 | Method call `map` | sub-sub array | transforms elements | [6, 7] | YEs uesed by `map` on line 2 |
| 7-8 | Block execution 3 | Each element of sub-sub array | transforms | 6, 7 | yes used by `map` on line 2 |


