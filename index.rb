require 'bundler'
#requires errthing
Bundler.require
require 'sinatra/json'
# require './models/post'

# set :database, {adapter: 'postgresq  l', database: 'lineup'}

# ActiveRecord::Base.establish_connection(
# :adapter => 'postgresql'
# :database => 'lineup')
#
# mime_type :json, "application/json"

# before do
#   content_type :json
# end

# helpers do
#   def json(dataset)
#     if !dataset
#       return no_data!
#     else
#       JSON.pretty_generate(JSON.load(dataset.to_json)) + "\n"
#     end
#   end
#
#   def no_data!
#     status 204
#   end
# end
#
# get '/posts/?:page?' do
#   get_page(params[:page])
# end
#
# get '/posts/search/:title' do
#   search (params[:title])
# end
#
# get '/posts' do
#   new_post = MultiJson.load(request.body.read)
#   @post = Post.new (new_post)
#   if @post.save
#     json @post
#   else
#     no_data!
#   end
# end
#
# put '/posts/:id' do
#   @post = Post.find_by_id params[:id]
#   if !@post
#     no_data!
#   else
#     update_post = MultiJson.load(request.body.read)
#     if @post.update_attributes(update_post)
#       json @post
#     else
#       json @post.errors.messages
#     end
#   end
# end
#
# delete '/posts/delete/:id' do
#   @post = Post.find_by_id params[:id]
#   if !@post
#     no_data!
#   else
#     @post.destroy
#   end
# end


class Post <ActiveRecord::Base

end

# before do
#   content_type :json
# end

get '/' do
  @posts = Post.all
  @name = "Leila"
  erb :index
  # @posts.to_json
end

post '/' do
  @post = Post.new(params)
  @post.save
end
