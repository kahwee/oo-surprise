class ServerType < ActiveRecord::Base
  validates :name, :uniqueness => true, :presence => true, :length => { :within => 2..31 }
  validates :description, :length => { :maximum => 511 }

  has_many :servers
  has_many :categories
end