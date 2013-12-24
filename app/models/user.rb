class User < ActiveRecord::Base
  has_many :products
  has_many :descriptions
  has_many :documents
end
