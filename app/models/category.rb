class Category < ActiveRecord::Base
  validates :name, :uniqueness => { :scope => :server_type_id }, :presence => true, :length => { :within => 2..31 }
  validates :description, :length => { :maximum => 511 }
  validates :server_type_id, :presence => true, :numericality => true

  belongs_to :server_type
  has_many :tasks
end