class MyLib
  @name = "mylib"

  def self.name
    @name
  end

  def name
    self.class.name
  end
end

class MyOtherLib < MyLib
  @name = "myotherlib"
end

puts MyLib.name
puts MyLib.new.name
puts MyOtherLib.name
