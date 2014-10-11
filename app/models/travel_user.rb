
class TravelUser < ActiveRecord::Base
	belongs_to :user
	belongs_to :travel
	scope :travels_of_user, ->(x){TravelUser.where({user_id:x}).map(&:travel_id)}
end
