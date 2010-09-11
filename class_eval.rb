class MyLib; end

MyLib.class_eval <<-RUBY
  def self.name
    "mylib"
  end

  def name
    "mylib's instance"
  end
RUBY

puts MyLib.name
puts MyLib.new.name
puts

MyLib.class_eval do
  def self.name
    "mylib"
  end

  def name
    "mylib's instance"
  end
end

puts MyLib.name
puts MyLib.new.name
