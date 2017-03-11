class User < ActiveRecord::Base
  #meesage specifies the error message when the corresponding attribute is invalid
  validates :fname, presence: true
  validates :lname, presence: true
  validates :email, presence: true, uniqueness: true, format: { with: /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i, message: "email is invalid" }
  validates :password, presence: true, length: {minimum: 6}

  has_many :linersToQueues
  has_many :queues, through: :linersToQueues

  has_many :adminsToQueues
  has_many :queues, through: :adminsToQueues  
end
