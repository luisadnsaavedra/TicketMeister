class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  #Method to redirect users to their tickets page after successful login
  def after_sign_in_path_for(resource)
    seats_path
  end

  #Method to redirect users to the concerts list after successful logout
  def after_sign_out_path_for(resource)
    concerts_path
  end

end
