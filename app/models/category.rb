class Category < ApplicationRecord
	has_many :articles
	belongs_to :client
end
