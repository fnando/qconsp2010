module Accessor
  def accessor(name)
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
end

class MyLib
  extend Accessor
  accessor :name
end

class MyOtherLib
  extend Accessor
  accessor :name
end
