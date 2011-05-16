require 'lib/adip/queue.rb'

puts Adip::Queue.methods.sort.join(',')
puts '-----------------------'
puts Adip::Queue.instance_variables
puts '-----------------------'
puts Adip::Queue.new().instance_variables
puts '-----------------------'
q=Adip::Queue.new(:id => 1)
puts q.id
puts '-----------------------'
puts q
puts q.inspect


