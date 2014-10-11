class Cost < ActiveRecord::Base
	belongs_to :user
	belongs_to :bill
	scope :cost_by_user, ->(bills){ Cost.joins(:bill).where('Costs.bill_id in (?)', bills.map(&:id)).select('sum(money) as user_money, user_id').group('user_id') }
end
