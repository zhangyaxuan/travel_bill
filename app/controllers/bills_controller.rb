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

	def edit
		@travel = Travel.find(params[:travel_id])
		@bill = Bill.find(params[:id])
	end

	def update
		@bill = Bill.find(params[:id])
		if @bill.update(bill_params) && update_cost
			redirect_to travel_path(params[:travel_id])
		else
			render 'edit'
		end
	end

	def destroy
		Bill.delete(params[:id])
		redirect_to travel_path(params[:travel_id])
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
		save_payer unless params['user_ids'].include?(bill_params['payer_id']) 
	end

	def update_cost
		Cost.delete_all(bill_id: params[:id])
		save_cost
	end

	def save_payer
		Cost.new(user_id: bill_params['payer_id'], bill_id:  @bill.id, money: 0.0).save
	end
end
