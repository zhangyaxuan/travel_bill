class SessionsController < ApplicationController
	skip_before_action :is_logged_in?
	
	def new
	end

	def create
		@user = User.authentication(params[:login], params[:password])
		if @user
			session[:user_id] = @user.id
			flash[:notice] = "Welcome #{@user.login}"
			redirect_to travels_path
		else
			flash[:notice] = "The login or password is not correct."
			redirect_to new_session_path
		end
	end

	def logout
		session[:user_id] = nil
		redirect_to new_session_path
	end
end
