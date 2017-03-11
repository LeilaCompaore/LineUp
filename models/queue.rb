class Queuee < ActiveRecord::Base
  #Queue is already a class in activeRecord, so QueueE
  validates :name, :description, :maxUsers, presence: true

  has_many :adminsToQueues
  has_many :users, through: :adminsToQueues
end
