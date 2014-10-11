class Travel < ActiveRecord::Base
	has_many :bills
	has_many :travel_users
	has_many :users, :through => :travel_users

	scope :total_cost, -> {}

	def total_cost
		self.bills.map{|b| b.cost}.reduce(:+)
	end
end
