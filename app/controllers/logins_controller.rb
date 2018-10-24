class LoginsController < ApplicationController
	def snew
		if logged_in?
			redirect_to '/summary'
		end
	end

	def screate
		user = User.find_by(email: params[:email])
		if !params[:email].include? "bu.edu"
			user = User.find_by(username: params[:email])
		end
		if user && user.authenticate(params[:password])
			session[:user_id] = user.id
			redirect_to '/summary'
		else
			flash[:danger] = "Invalid email/password combination"
			render 'snew'
		end
	end

	# def new
	# 	if logged_in?
	# 		redirect_to '/summary'
	# 	end
	# end

	# def create
	# 	user = User.find_by(email: params[:email])
	# 	if !params[:email].include? "bu.edu"
	# 		user = User.find_by(username: params[:email])
	# 	end
	# 	if user && user.authenticate(params[:password])
	# 		session[:user_id] = user.id
	# 		redirect_to '/candidates'
	# 	else
	# 		flash[:danger] = "Invalid email/password combination"
	# 		render 'new'
	# 	end
	# end

	# def destroy
	# 	session[:user_id] = nil
	# 	redirect_to root_path
	# end

	def sdestroy
		session[:user_id] = nil
		redirect_to "/summary/login"
	end
end