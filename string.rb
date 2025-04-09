msg = 'This tutorial is from JavaTpoint.'
puts msg['Jenkins'] || 'oops not found'
# Jenkins is not present is string hence op is oops
puts msg['Java'] || 'oops not found'
puts msg[3]
puts msg[3, 5]
# from index 3 move 5 times
puts msg[3..5]
puts msg[0, msg.length]
msg.freeze
msg[0] = 'R'
