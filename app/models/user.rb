class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable, :lockable and :timeoutable
	devise :database_authenticatable, :registerable, :recoverable, :rememberable, :trackable, :validatable
  validates :email, :length => { :within => 5..50 },:format => { :with => /^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,4}$/i }

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me
  #validates :principal_name, :uniqueness => true, :presence => true, :length => { :within => 1..127 }
  #validates :display_name, :length => { :maximum => 63 }
  #validates :short_name, :length => { :maximum => 15 }
end