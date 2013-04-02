class Tag < ActiveRecord::Base
  has_many :urls_tags
  has_many :urls, :through => :url_tags
end