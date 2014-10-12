class TravelsController < ApplicationController

	def new
		@travel = Travel.new
		@users = User.all
	end
	def create
		@travel = Travel.new(travel_params)

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
		@travels = Travel.where('Travels.id in (?)',TravelUser.travels_of_user(session[:user_id]))
	end

	def show
		@travel = Travel.find(params[:id])
	end

	def result
		@travel = Travel.find(params[:travel_id])
		@travel_cost = @travel.total_cost
		@user_costs = Cost.cost_by_user(@travel.bills).map{|x| {x.user_id => x.user_money}}

		@user_pays = Bill.pay_by_user(@travel.bills).map { |x| {x.payer_id => x.user_pay}  }
		
		@results = @user_costs.map{|x| {x.keys.first => calculate(x, @user_pays)} }
	end


	private
	def travel_params
		params.require(:travel).permit(:name)
	end

	def calculate(user_cost, user_pays)
		cost = user_cost.values.first
		user_pay = @user_pays.select {|y| user_cost.keys.first == y.keys.first }.at(0)
		unless user_pay.blank?
		 	return user_pay.values.first - cost
		end 
		return 0 - cost
	end
end
