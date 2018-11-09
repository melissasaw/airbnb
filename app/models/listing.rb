class Listing < ApplicationRecord
	belongs_to :user
	has_many :reservations
	validates :title, presence: true
	validates :title, uniqueness: true
	
	include PgSearch
  	pg_search_scope :search_by_title, :against => :title 
  	pg_search_scope :search_by_city, :against => :city

	scope :max_price, -> (max_price){where("price <= ?", max_price)}
	scope :city, -> (city) { where city: city }
	scope :occupant, -> (occupant){where occupant: occupant}
	scope :bed_number, -> (bed_number) { where bed_number: bed_number}
	scope :toilets,-> (toilets) { where toilets: toilets }
	scope :pet,-> (pet) { where pet: pet }
	scope :smoker,-> (smoker) { where smoker: smoker }
	scope :starts_with,-> (title) { where title: title }

	mount_uploaders :avatars, AvatarUploader
end