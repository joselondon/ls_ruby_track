# buffer variable is passed to the method and is being modified
# by << method from within rolling_buffer1()
def rolling_buffer1(buffer, max_buffer_size, new_element)
  buffer << new_element
  buffer.shift if buffer.size > max_buffer_size
  buffer
end

# input array itself is not being modified the value here is being assigned
# to a new variable - buffer. Methods will return buffer value but 
# input_array will remain unmodified
def rolling_buffer2(input_array, max_buffer_size, new_element)
  buffer = input_array + [new_element]
  buffer.shift if buffer.size > max_buffer_size
  buffer
end