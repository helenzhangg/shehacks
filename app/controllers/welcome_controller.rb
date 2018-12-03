class WelcomeController < ApplicationController
	def index
	end	

	def typeformget
		render :json => "Typeform Get called."
	end

	def typeformpost
		render :json => "Typeform Post called."
	end
end