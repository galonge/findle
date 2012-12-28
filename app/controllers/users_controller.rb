class UsersController < ApplicationController
  

  def show
  	@user = User.find(params[:id])
  end


  def new
  	@user = User.new
  end

  def create
  	@user = User.new(params[:user])
  	if @user.save
      log_in @user
      flash[:success] = "Welcome to findle. Your account was successfully created"
       redirect_to @user
  		#handle successful saved user

  	else
  		render 'new'
  	end
  end

end
