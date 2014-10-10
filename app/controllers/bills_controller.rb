class BillsController < ApplicationController
	def create
		@travel = Travel.find(params[:travel_id])
		@bill =	@travel.bills.create(bill_params)
		save_cost
		
		redirect_to travel_path(@travel)
	end

	def bill_params
		params.require(:bill).permit(:payer_id, :cost, :subject, :date, :comment)
	end

	private
	def save_cost
		consumer_ids = params['user_ids']
		consumer_ids.each do |consumer_id|
			@cost = Cost.new
			@cost.user_id = consumer_id
			@cost.bill_id = @bill.id
			@cost.money = bill_params['cost'].to_f / consumer_ids.length
			@cost.save		
		end
	end
end
