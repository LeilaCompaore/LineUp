require 'sinatra'
require 'sinatra/activerecord'
require './config/environments'
require './models/model'
get '/' do
  # "Hello world, its #{Time.now}"
  # erb :home, :layout => :homelayout
  erb :"public/homelayout"
  # home = true
end
get '/login' do
  "login page"
end
get '/error' do
  "Errorpage"
  erb :"public/errorpage"
  # err = true
end
get '/register' do
  "register page"
end

get '/profile' do
  erb :"user/profile"
end
get '/minuterie' do
  "minuterie"
end
get '/signup' do
  erb :"public/signup"
end
post '/welcome' do
  erb :"user/welcome", locals: {:firstname => params[:firstname],
                                :lastname => params[:lastname],
                                :email => params[:email],
                                :password => params[:password]
                                }
end

# use Rack::Auth::Basic, "Potected Area" do |adminName, adminPass|
#   adminName == 'adminn' && adminPass == 'admin'
#   get '/admin' do
#     'admin login'
#   end
# end
