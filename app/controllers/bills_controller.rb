class BillsController < ApplicationController
	def create
		@travel = Travel.find(params[:travel_id])
		@bill =	@travel.bills.create(bill_params)
		redirect_to travel_path(@travel)
	end

	def bill_params
		params.require(:bill).permit(:payer, :cost, :subject, :date, :comment)
	end
end
