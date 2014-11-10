class TestUser < ActiveRecord::Base
  attr_accessor :rating

  def initialize
    self.rating = 1500
  end
end