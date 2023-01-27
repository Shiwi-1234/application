class Client < ApplicationRecord
  has_many :categories
  
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
