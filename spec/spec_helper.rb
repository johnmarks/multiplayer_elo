require 'active_record'
require 'multiplayer_elo'
require 'multiplayer_elo/test_user'

ActiveRecord::Base.establish_connection(:adapter => "sqlite3", :database => File.dirname(__FILE__) + "/test.sqlite3")

ActiveRecord::Schema.define do
  self.verbose = false

  create_table :test_users, :force => true do |t|
    t.integer :rating
    t.timestamps
  end
end
