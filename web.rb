require 'sinatra'
require 'bundler'
#requires errthing
Bundler.require

class Main < Sinatra::Base
  get '/' do
    puts "debut"
    "allo"
    puts "fin"
  end
end
