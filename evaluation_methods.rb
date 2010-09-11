puts "Classes:"
puts "respond to class_eval: " + Object.respond_to?(:class_eval).to_s
puts "respond to instance_eval: " + Object.respond_to?(:instance_eval).to_s
puts
puts "Instances:"
puts "respond to class_eval: " + Object.new.respond_to?(:class_eval).to_s
puts "respond to instance_eval: " + Object.new.respond_to?(:instance_eval).to_s
