class MyLib; end

lib = MyLib.new

lib.instance_eval do
  puts self.kind_of?(MyLib)
end
