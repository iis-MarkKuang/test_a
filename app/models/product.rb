class Product < ActiveRecord::Base
  belongs_to :user
  
  has_many :descriptions, validate: true, dependent: :destroy
  has_many :documents, through: :descriptions
end
