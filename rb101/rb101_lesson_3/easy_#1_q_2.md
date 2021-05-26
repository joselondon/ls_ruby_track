`!` Can be used in the following ways: -

* A comparison operator (NOT) eg `!true == false`

* Can also be used at the end of a method name to indicate that the method is destructive eg `[1,1,2,3].uniq!` 

`?`
  * can also be used at the end of a method name to indicate that the method returns a boolean `true` or `false` eg `is_a?`

  * can also be used as a ternary `if`

  **Bear in mind when `!` or `?` are placed at the end of a method name the are part of the method name and not part of Ruby syntax - they are used to indicated the function of the method - they are not a guarantee - it depends on the implementation**

* `!=` => ***'Does not equal'*** comparison operator to determin if the values of two operands are equal<br>
<br>
* `!user_name` in this case `!` is equivalent to the `NOT` logical operator.  ie sets `user_name to false`<br>
<br>
* `uniq!` in this case `!` at the end of a method name indicates the method is destructive to the caller.<br>
<br>
* `?` before something would potentailly be using the ternary conditional operator but only in conjunction with `:` without the colon `?` will return an error<br>
<br>
* `!!username` the `!!` is the equivalent of `NOT NOT` logical operator which essentially sets the suername to `true`  






