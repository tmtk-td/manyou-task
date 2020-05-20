class ApplicationController < ActionController::Base
  before_action :set_current_user
  protect_from_forgery with: :exception
  include SessionsHelper
  def set_current_user
    @current_user = User.find_by(id: session[:user_id])
  end
  def authenticate_user
    if @current_user == nil
      flash[:notice] = ""
      redirect_to new_session_path
    end
  end
  def forbid_login_user
    if @current_user
      flash[:notice] = "すでにログインしています！"
      redirect_to tasks_path
    end
  end
end