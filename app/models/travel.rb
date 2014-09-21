class Travel < ActiveRecord::Base
	has_many :authorities_travel_and_user
	has_many :user, :through => :authorities_travel_and_user
end
