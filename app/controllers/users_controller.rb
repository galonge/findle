class UsersController < ApplicationController
  before_filter :logged_in_user, only:[:index, :edit, :update, :destroy]
  before_filter :correct_user, only: [:edit, :update]
  before_filter :admin_user, only: :destroy
  


  def index
    #using the "User.paginate" instead of User.all to generate the list of users because the paginate gem expects a @user object of class Active record -Relation and "User.all" generates object of class Array
    #params[:page] is automatically made available by will paginate gem in params
    @users = User.paginate(page: params[:page])

  end

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

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(params[:user])
      flash[:success] = "Profile updated successfully"
      log_in @user
      redirect_to @user
    #Handle a successful update
    else
      render 'edit'
    end

  end

  def destroy
    User.find(params[:id]).destroy
    flash[:success] = "User destroyed successfully."
    redirect_to users_path
  end
  private

        def logged_in_user
          unless logged_in?
            store_location
            redirect_to login_path, notice: "Please log in first."
          end
        end


        def correct_user
          @user = User.find(params[:id])
          redirect_to(root_path) unless current_user?(@user)
        end

        def admin_user 
          redirect_to(root_path) unless current_user.admin?
        end

end
