class ServerTaskStatus < ActiveRecord::Base
  validates :status_id, :presence => true, :numericality => true
  validates :server_id, :presence => true, :numericality => true
  validates :task_id, :presence => true, :numericality => true
  
  belongs_to :server
  belongs_to :task
end