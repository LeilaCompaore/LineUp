class AdminsToQueues < ActiveRecord::Base
  belongs_to :queue
  belongs_to :user
end
