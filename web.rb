require 'sinatra'
require 'bundler'
#requires errthing
Bundler.require

class Web < Sinatra::Application
  get '/' do
    "allo"
  end
end
