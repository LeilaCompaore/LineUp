class AdminsToQueue < ActiveRecord::Base
  belongs_to :queuee
  belongs_to :user
end
