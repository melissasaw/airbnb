class Listing < ApplicationRecord
	belongs_to :user
	has_many :reservations
	validates :title, presence: true
	validates :title, uniqueness: true

	mount_uploaders :avatars, AvatarUploader
end
