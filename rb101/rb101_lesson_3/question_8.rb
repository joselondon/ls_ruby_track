flintstones.assoc("Barney")

flintstones.select {|k, v| k == "Barney"}.to_a.flatten

#or

flintstones.assoc('Barney')