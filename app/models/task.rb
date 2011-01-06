class Task < ActiveRecord::Base
  validates :name, :uniqueness => { :scope => :category_id }, :length => { :within => 2..31 }
  validates :description, :length => { :maximum => 511 }
  validates :category_id, :presence => true, :numericality => true

  belongs_to :category
end