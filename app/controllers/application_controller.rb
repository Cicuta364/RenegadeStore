class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  	rescue_from CanCan::AccessDenied do |exception|
    redirect_to root_url, alert: 'Su usuario no esta autorizado para realizar esta accion'
	end

	def configure_permitted_parameters
      devise_parameter_sanitizer.for(:sign_up) << [:name, :lastname, :username]
      devise_parameter_sanitizer.for(:account_update) << [:name, :lastname, :username]
  	end
end
