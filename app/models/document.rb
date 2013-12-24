class Document < ActiveRecord::Base
  belongs_to :user

  has_many :descriptions, validate: true, dependent: :destroy
  has_many :products, through: :descriptions
end
