require 'sinatra'
require 'bundler'
#requires errthing
Bundler.require

class Web < Sinatra::Base
  get '/' do
    "allo"
  end
end
