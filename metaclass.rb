# Check it out an alternative implementation on singleton_class.rb
# that uses the new method singleton_class, added by Ruby 1.9.2.
#
class MyLib
  class << self
    attr_accessor :name
  end

  self.name = "mylib"
end

class MyOtherLib < MyLib
  self.name = "myotherlib"
end

module MyModule
  class << self
    attr_accessor :name
  end

  self.name = "MyModule"
end

puts MyLib.name
puts MyOtherLib.name
puts MyModule.name