class ApplicationController < ActionController::Base
	protect_from_forgery with: :exception
	helper_method :current_user, :logged_in?

	def current_user
		@current_user ||= User.find(session[:user_id]) if session[:user_id]
	end

	def logged_in?
		!!current_user
	end

	def is_admin?
		logged_in? and !!current_user.admin
	end

	def authenticate_gremlin
		if !session[:user_id] or !current_user.admin
			redirect_to "/summary/login"
		end
	end

	def destroy_gremlin
		@current_user = nil
		redirect_to "/summary/login"
	end

	def require_user
		if !logged_in?
			flash[:danger] = "You must be logged in to perform that action."
			redirect_to root_path
		end
	end

	def require_admin
		if !logged_in? and !current_user.admin
			flash[:danger] = "You need to be an admin to perform that action."
			redirect_back fallback_location: root_path
		end
	end

end
