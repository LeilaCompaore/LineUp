require 'sinatra'
get '/' do
  # "Hello world, its #{Time.now}"
  # erb :home, :layout => :homelayout
  erb :homelayout
  # home = true
end
get '/login' do
  "login page"
end
get '/error' do
  "Errorpage"
  erb :homelayout
  # err = true
end
get '/register' do
  "register page"
end

get '/profile' do
  erb :profile
end
get '/minuterie' do
  "minuterie"
end

# use Rack::Auth::Basic, "Potected Area" do |adminName, adminPass|
#   adminName == 'adminn' && adminPass == 'admin'
#   get '/admin' do
#     'admin login'
#   end
# end
