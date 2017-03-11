class LinersToQueues < ActiveRecord::Base
  belongs_to :queue
  belongs_to :user
end
