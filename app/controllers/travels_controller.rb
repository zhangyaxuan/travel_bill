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
		binding.pry
	end

	private
	def travel_params
		params.require(:travel).permit(:name)
	end
end
