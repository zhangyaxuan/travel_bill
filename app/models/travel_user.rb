
class TravelUser < ActiveRecord::Base
	belong_to :user
	belong_to :travel
end
