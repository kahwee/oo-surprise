class ServerTaskStatus < ActiveRecord::Base
  validates :status_id, :presence => true, :numericality => true
  validates :server_id, :presence => true, :numericality => true
  validates :task_id, :presence => true, :numericality => true
  
  belongs_to :server
  belongs_to :task
  
  STATUSES = [
    ['Not applicable', 0], 
    ['Pending', 1], 
    ['Done', 9]
  ]
end