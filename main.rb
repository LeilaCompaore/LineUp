require 'bundler'
#requires errthing
Bundler.require

require './models/article'
require './models/review'
DataMapper.setup(:default, 'postgres://localhost/lineup')
DataMapper.finalize
DataMapper.auto_migrate!


## for here ruby main.rb ==>
get '/' do
  "hello world"
end

#curl localhost:4567/reviews && echo
get '/reviews' do
  content_type :json
  reviews = Review.all
  reviews.to_json
end

#curl -d "review[name]=hello&review[text]=woorrlldd" localhost:4567/reviews && echo
post '/reviews' do
  review = Review.new params[:review]
  if review.save
    status 201
    json "Review was save"
  else
    status 500
  end
end
## ===|

## for here rackup main.rb ==>
class Main < Sinatra::Base
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
end
## ===|
