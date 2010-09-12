require "rubygems"
require "active_record"
require "test/unit"

ActiveRecord::Base.establish_connection :adapter => "sqlite3", :database => ":memory:"
ActiveRecord::Schema.define do
  create_table :conferences do |t|
    t.string :name, :permalink
  end
end

module Permalink
  def self.included(base)
    base.send :extend, ClassMethods
  end

  module ClassMethods
    def has_permalink
      class_eval do
        before_validation :generate_permalink
        include InstanceMethods
      end
    end
  end

  module InstanceMethods
    def generate_permalink
      write_attribute :permalink, name.to_s.downcase.gsub(/[^\w-]/m, "-") unless permalink
    end
  end
end

ActiveRecord::Base.send :include, Permalink

class String
  def to_permalink
    self.downcase.gsub(/[^\w-]/, "-")
  end
end

"welcome to QConSP".to_permalink

class Conference < ActiveRecord::Base
  has_permalink
end

class ConferenceTest < Test::Unit::TestCase
  def test_generate_permalink
    conf = Conference.create(:name => "QConSP")
    assert_equal "qconsp", conf.permalink
  end

  def test_generate_permalink_for_multiple_words
    conf = Conference.create(:name => "QConSP 2010")
    assert_equal "qconsp-2010", conf.permalink
  end
end
