class MyLib
  NAMES = { :name => "mylib's instance" }

  def method_missing(method, *args)
    if NAMES.key?(method.to_sym)
      NAMES[method.to_sym]
    else
      super
    end
  end

  def respond_to?(method, include_private = false)
    if NAMES.key?(method.to_sym)
      true
    else
      super
    end
  end
end

lib = MyLib.new
puts lib.name
puts lib.respond_to?(:name)
