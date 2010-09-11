# This example is the same as metaclass.rb
# but uses the new singleton_class method
# introducted by Ruby 1.9.2.
#
# http://redmine.ruby-lang.org/issues/show/1082
#
class Object
  def singleton_class
    class << self; self; end
  end
end unless Object.respond_to?(:singleton_class)

class MyLib
  singleton_class.class_eval do
    attr_accessor :name
  end

  self.name = "mylib"
end

class MyOtherLib < MyLib
  self.name = "myotherlib"
end

puts MyLib.name
puts MyOtherLib.name
