class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  include Auth

  def check_current_user
    redirect_to root_path and return unless current_user
  end

  layout 'bootstrap'
end
