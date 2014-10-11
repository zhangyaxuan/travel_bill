class TravelsController < ApplicationController

	def new
		@travel = Travel.new
		@users = User.all
	end
	def create
		@travel = Travel.new(travel_params)

		#binding.pry
		user_ids = params['user_ids']
		user_ids.each do |u_id|
			u = ::User.find(u_id)
			@travel.users << u
		end

		@travel.creater = User.find(session[:user_id])
		if @travel.save
			redirect_to travels_path
		else
			render 'new'
		end
	end

	def index
		@travels = Travel.all
	end

	def show
		@travel = Travel.find(params[:id])
	end

	def result
		travel = Travel.find(params[:travel_id])
		users = travel.users
		@result = Hash.new
		#binding.pry
		@total_cost = 0.0
		travel.bills.each do |bill|
			@total_cost += bill.cost
			users.each do |user|
				one_cost = Cost.where({bill_id:bill.id, user_id:user.id})[0]['money'] if Cost.where({bill_id:bill.id, user_id:user.id}).present?
				one_cost = 0.0 if one_cost.blank?
				unless @result[user.login].blank?
					@result[user.login] += one_cost
				else
					@result[user.login] = one_cost
				end
			end
		end
		binding.pry
	end

	private
	def travel_params
		params.require(:travel).permit(:name)
	end
end
