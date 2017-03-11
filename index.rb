require 'bundler'
#requires errthing
Bundler.require
require 'sinatra/json'

require './models/adminsToQueues'
require './models/linersToQueues'
require './models/user'
require './models/queue'

class Post <ActiveRecord::Base

end

before do
  content_type :json
end

get '/' do
  @posts = Post.all
  @posts.to_json
end

post '/' do
  @post = Post.new(params)
  @post.save
end

get '/users' do
  @users = User.all
  @users.to_json
end

post '/users' do
  @user = User.new(params)
  if @user.save
    status 201
    json "User was saved"
  else
    status 500
    json "An error occured"
    #trynna print the error messages
    # @user.errors.messages
  end
end

get '/queues' do
  @queues = Queuee.all
  @queues.to_json
end

post '/queues' do

  #before a queue is saved, it has to be associated with an admin

  #first get the adminId
  @adminId = params[:adminId]

  #delete it from the params
  params.delete("adminId")
  #to print the params in a API manner
  # params.to_json
  @queue = Queuee.new(params)

  #then create the queue with the now clean params
  if @queue.save
    status 201
    json "Queue was saved"
  else
    status 500
    json "An error occured"
  end

  #finally, associate the queue and the admin
  #first find the admin user object then create
  # if User.find(@adminId).adminsToQueues.create(queue: @queue)
  #   status 201
  #   json "Queue associated with admin"
  # else
  #   status 500
  #   json "An error occured with the assocaition"
  # end


end

get '/admin' do
  @adminsToQueues = AdminsToQueues.all
  @adminsToQueues.to_json
end

get '/liner' do
  @linersToQueues = LinersToQueues.all
  @linersToQueues.to_json
end
