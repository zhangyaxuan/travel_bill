class Bill < ActiveRecord::Base
	belongs_to :travel
	has_many :costs
	has_many :users, :through => :costs
 	belongs_to :user, foreign_key: 'payer_id'

 	def payer
 	end
end
