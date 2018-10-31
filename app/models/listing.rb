class Listing < ApplicationRecord
	belongs_to :user
	validates :title, presence: true
	validates :title, uniqueness: true
end
