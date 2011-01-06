class User < ActiveRecord::Base
  validates :principal_name, :uniqueness => true, :presence => true, :length => { :within => 1..127 }
  validates :display_name, :length => { :maximum => 63 }
  validates :short_name, :length => { :maximum => 15 }
end