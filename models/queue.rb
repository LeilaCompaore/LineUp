class Queuee < ActiveRecord::Base
  #Queue is already a class in activeRecord, so QueueE
  validates :name, :description, :maxUsers, presence: true

  has_many :adminsToQueue
  has_many :users, through: :adminsToQueue

  has_many :linersToQueue
  has_many :users, through: :linersToQueue
end
