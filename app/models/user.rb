class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable, :lockable and :timeoutable
  devise :ldap_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me
  validates :principal_name, :uniqueness => true, :presence => true, :length => { :within => 1..127 }
  validates :display_name, :length => { :maximum => 63 }
  validates :short_name, :length => { :maximum => 15 }
end