class Bill < ActiveRecord::Base
	belongs_to :travel
	has_many :costs
	has_many :users, :through => :costs
 	belongs_to :user, foreign_key: 'payer_id'

 	scope :pay_by_user, ->(bills){ bills.select('sum(cost) as user_pay, payer_id').group('payer_id')}

end
