class Travel < ActiveRecord::Base
	has_many :bills
	has_many :travel_users
	has_many :users, :through => :travel_users
end
