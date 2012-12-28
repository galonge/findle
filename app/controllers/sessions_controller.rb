class SessionsController < ApplicationController
  def new
  end

  def create

  	#fetching the user from the database by email
  	user = User.find_by_email(params[:session][:email])

  	#if a user with the email exists, and user.authenticate(password) returns true,
  	if user && user.authenticate(params[:session][:password])
  		#sign the user in and redirect to the user's show page

  		#calls the sign_in function in app/helpers/sessionsHelper to perform sign_in and set remember token in visitors browser
      log_in user
  		redirect_to user

  	else
  		flash.now[:error] = "Invalid email/password combination"
  		render 'new'
  	end
  end

  def destroy
    log_out
    redirect_to root_path
  end
end
