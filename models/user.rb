class User < ActiveRecord::Base
  #meesage specifies the error message when the corresponding attribute is invalid
  validates :fname, presence: true
  validates :lname, presence: true
  validates :email, presence: true, uniqueness: true, format: { with: /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i, message: "email is invalid" }
  validates :password, presence: true, length: {minimum: 6}

  has_many :linersToQueue
  has_many :queuees, through: :linersToQueue

  has_many :adminsToQueue
  has_many :queuees, through: :adminsToQueue
end
