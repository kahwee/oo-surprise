class Task < ActiveRecord::Base
  validates :name, :uniqueness => { :scope => :category_id }, :length => { :within => 2..511 }
  validates :description, :length => { :maximum => 511 }
  validates :category_id, :presence => true, :numericality => true

  belongs_to :category
  has_many :server_task_statuses
end