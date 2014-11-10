require 'spec_helper'

describe MultiplayerElo do
  it 'adding acts_as_rateable should be included in active record' do
    class Foo < ActiveRecord::Base
      acts_as_rateable
    end
  end

end