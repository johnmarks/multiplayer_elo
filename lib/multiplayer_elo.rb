require "multiplayer_elo/version"
require 'multiplayer_elo/rating_manager'

module MultiplayerElo
  module Rateable
    extend ActiveSupport::Concern

    module ClassMethods
      def acts_as_rateable(options = {})
        # your code will go here
      end
    end
  end
end

ActiveRecord::Base.send(:include, MultiplayerElo::Rateable)