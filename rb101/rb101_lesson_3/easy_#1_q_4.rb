numbers = [1, 2, 3, 4, 5]

# both methods are destructive: -

numbers.delete_at(1) # deletes the argument at the index passed as an argument in this case 1.
                     # numbers = [1, 3, 4, 5].  Deleted object is returned
numbers.delete(1) # deletes objects matching the argument passed to the method ie 1.  
                  # numbers = [2, 3, 4, 5]   The last object deleted is returned ie 1.