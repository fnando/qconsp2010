class MyLib
  class << self
    attr_accessor :name
  end

  def self.configure(&block)
    yield self
  end
end

MyLib.configure do |config|
  config.name = "mylib"
end

puts MyLib.name
