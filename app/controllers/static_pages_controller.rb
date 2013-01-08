class StaticPagesController < ApplicationController
  
  def home
  	@photopost = current_user.photoposts.build if logged_in?
  end

  def help
  end

  def about
  end

  def contact
  end
end
