class Document < ActiveRecord::Base
  belongs_to :user

  has_many :descriptions, validate: true, dependent: :destroy, inverse_of: :document
  has_many :products, through: :descriptions, inverse_of: :documents
end
