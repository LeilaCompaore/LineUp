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
  @password = params[:password]
  @user = User.find_by! email: @email
  if @user
    status 201
    json "FOUND"
    if @user.password == @password
      @user.to_json
    else
      json "PASSWORD NOT CORRECT"
    end
  else
    status 500
    json "NOT FOUND"
  end
end

#create queue
post '/queue' do
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

#find all the queues for A CERTAIN USER ADMIN
get '/myqueues' do
  @myqueues = AdminsToQueue.where(user_id: params[:adminId])
  if @myqueues
    status 201
    json "works"
    @myqueues.to_json
  else
    json "Error admin to queues"
  end
end

#I have tested this but it probably need un coup d'oeil extra
#serve a user (courtoisie d'un admin seulement)
post '/serveuser' do
  #ZERO actually. Does the user (liner) exist? the admin? the queue? ya right. fix that gurl
  @userToBeServed = User.find(params[:userId])
  @admin = User.find(params[:adminId])
  @queue = Queuee.find(params[:queueId])
  if @userToBeServed && @admin && @queue
    #FIRST find if the admin is really administrating the queue specified
    @findAdminQueue = AdminsToQueue.where("user_id = ? AND queuee_id = ?", params[:adminId], params[:queueId])
    if !@findAdminQueue.empty?
      #SECOND find if the user is actually registered inthe queue
      @findUserInQueue = LinersToQueue.where("user_id = ? AND queuee_id = ?", params[:userId], params[:queueId])
      if !@findUserInQueue.empty?
        @findUserInQueue.first.destroy
      else
        json "liner not found"
      end
    else
      json "queue not found for this admin"
    end
  else
    json "either your admin, or liner or queue doesnot exist. Ya you tried"
  end
end

#register in a line
post '/registerinline' do
  #FIRST is the line really there AND is the user really a user
  @queue = Queuee.find(params[:queuee_id])
  @user = User.find(params[:user_id])
  if @queue && @user
    #SECOND is the liner already registered
    @possibleUserAlreadyInLine = LinersToQueue.where("user_id = ? AND queuee_id = ?", params[:user_id], params[:queuee_id])
    if !@possibleUserAlreadyInLine.empty?
      # json "you're aleady in line my friend"
      @possibleUserAlreadyInLine.to_json
    else
      # THEM try register the liner
      @liner = LinersToQueue.new(params)
      if @liner.save
        json "registered"
      else
        json "not registered AN error occured"
      end
    end

  else
    json "QUeue not found or user not found"
  end
end
