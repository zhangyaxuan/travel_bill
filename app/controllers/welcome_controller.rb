class WelcomeController < ApplicationController
  skip_before_action :is_logged_in?
  
  def index
  end
end
