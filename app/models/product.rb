class Product < ActiveRecord::Base
  belongs_to :user
  
  has_many :descriptions, validate: true, dependent: :destroy, inverse_of: :product
  has_many :documents, through: :descriptions, inverse_of: :products
end
