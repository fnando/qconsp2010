class MyLib
end

class Integer
  def kbytes
    self * 1024
  end
end

puts 128.kbytes

# Class methods
MyLib.class_eval do
  class << self
    define_method "name" do
      @name ||= "mylib"
    end

    define_method "name=" do |name|
      @name = name
    end
  end
end

# Instance methods
MyLib.class_eval do
  define_method "name" do
    @name ||= "mylib's instance"
  end

  define_method "name=" do |name|
    @name = name
  end
end

puts "Class methods:"
puts MyLib.name
puts MyLib.name = "mynewname"
puts
puts "Instance methods:"
lib = MyLib.new
puts lib.name
puts lib.name = "mynewname's instance"