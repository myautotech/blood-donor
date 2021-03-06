class ApplicationController < ActionController::Base
# Prevent CSRF attacks by raising an exception.
# For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_filter :authenticate_user!
  rescue_from CanCan::AccessDenied do |exception|
    redirect_to users_path, alert: exception.message
  end

  private

  def after_sign_in_path_for(*)
    users_path
  end

  def after_sign_out_path_for(*)
    about_home_index_path
  end
end