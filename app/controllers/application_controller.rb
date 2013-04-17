class ApplicationController < ActionController::Base
  protect_from_forgery


  def login_required
    if session[:user]
      @user = User.find(session[:user])
    end
    unless @user
      redirect_to "/login"
      return
    end
  end
end
