class MyLib
end

lib = MyLib.new
other_lib = MyLib.new

class << lib
  attr_accessor :name
end

puts lib.respond_to?(:name)
puts other_lib.respond_to?(:name)