require "#{File.dirname(File.expand_path(__FILE__))}/lib/adip/sender"

config = {:mode => 'f'}
sender = Adip::Sender.new(config)
qc = {:id => 1, :type => "$dlq"}
q = Adip::Queue.new(qc)
sender.push q
puts "--------------------------------"
config = {:mode => 's'}
sender = Adip::Sender.new(config)
qc = {:id => 1, :type => "$dlq"}
q = Adip::Queue.new(qc)
sender.push q
puts "--------------------------------"


