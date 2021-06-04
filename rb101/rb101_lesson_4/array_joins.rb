str = 'How do you get to Carnegie Hall?'
arr = str.split # => ["How", "do", "you", "get", "to", "Carnegie", "Hall?"]
arr.join        # => "HowdoyougettoCarnegieHall?"

arr.join(' ')   # =>["How", "do", "you", "get", "to", "Carnegie", "Hall?"]
arr*(" ")       # =>["How", "do", "you", "get", "to", "Carnegie", "Hall?"]