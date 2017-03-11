require 'bundler'
#requires errthing
Bundler.require
require 'sinatra/json'

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
