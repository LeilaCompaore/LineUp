require 'sinatra'
require 'bundler'
#requires errthing
Bundler.require

class Main < Sinatra::Base
  get '/' do
    "allo"
  end
end
