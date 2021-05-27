def foo(param = "no")
  "yes"
end

def bar(param = "no")
  param == "no" ? "yes" : "no"
end

bar(foo)

# yes 
# beacuse foo() returns yes
# yes is passed to bar overridding the default param value.  
# becasue param == "yes" the ternary evaluates to "no" which is then 
# returned by bar()