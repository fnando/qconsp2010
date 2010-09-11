class MyLib; end

lib = MyLib.new
handler = proc { self.kind_of?(MyLib) }

puts "Without instance context"
puts "instance of MyLib: #{handler.call}"
puts
puts "Within instance context"
puts "instance of MyLib: #{lib.instance_eval(&handler)}"
