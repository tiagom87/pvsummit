class PagesController < ApplicationController

  def home
  	if current_user
  		if current_user.admin == true
  			redirect_to applications_path
  		else
  			redirect_to application_path(current_user.id)
  		end
  	else
  		@landing = "hello"
      redirect_to new_user_registration_path
  	end
  end
end
