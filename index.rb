require 'bundler'
#requires errthing
Bundler.require
require 'sinatra/json'

require './models/adminsToQueue'
require './models/linersToQueue'
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
  #the following ifs statements should be wrapped in a transation:
  #meaning the failure of one should lead to the failure of the whole persistence action

  #before a queue is saved, it has to be associated with an admin
  #first get the adminId
  @adminId = params[:adminId]

  #delete it from the params
  params.delete("adminId")
  #to print the params in a API manner
  #params.to_json
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
  @usr = User.find(@adminId)

  if @usr.adminsToQueue.create(queuee: @queue)
    status 201
    json "Queue associated with admin"
  else
    status 500
    json "An error occured with the assocaition"
  end

end

get '/admin' do
  @adminsToQueues = AdminsToQueue.all
  @adminsToQueues.to_json
end

get '/liner' do
  @linersToQueues = LinersToQueue.all
  @linersToQueues.to_json
end



# ACTIONS

# create user

post '/signup' do
  @user = User.new(params)
  if @user.save
    status 201
    json "User was saved"
  else
    status 500
    json "An error occured"
  end
end

#get a user by email
get '/signin' do
  @email = params[:email]
  @user = User.find_by! email: @email
  if @user
    status 201
    json "FOUND"
    @user.to_json
  else
    status 500
    json "NOT FOUND"
  end
end
