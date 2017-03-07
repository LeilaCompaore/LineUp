require 'data_mapper'

class Article < ActiveRecord::Base
  include DataMapper::Resource

  property :id, Serial
  property :title, String
  property :content, Text
  property :published, Boolean, default: false
  property :published_on, Date, required:false
  property :likes, Integer, default:0

  def publish!
    @published = true
    @published_on = Date.today
  end
end

DataMapper.finalize
