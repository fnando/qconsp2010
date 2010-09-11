class MyLib
  def self.accessor(name)
    class_eval <<-RUBY
      def self.#{name}(*args)
        if args.size.zero?
          @#{name}
        else
          @#{name} = args.last
        end
      end
    RUBY
  end

  accessor :name
end

MyLib.class_eval do
  name "mycustomname"
  name
end

def configure(&block)
  MyLib.instance_eval(&block)
end

configure do
  name "mylib"
  name
end
