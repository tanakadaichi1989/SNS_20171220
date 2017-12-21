class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :set_current_user
  before_action :authenticate_user

  def set_current_user
    @current_user = User.find_by(id: session[:user_id])
  end

  def authenticate_user
      if @current_user != nil
        flash[:notice] = "You need LOGIN or SIGNUP."
        redirect_to("/login")
      end
  end

  def forbid_login_user
    if @current_user
      flash[:notice] = "You're already log-in."
      redirect_to("/")
    end
  end

end
