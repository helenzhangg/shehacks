class WelcomeController < ApplicationController

	skip_before_action :verify_authenticity_token, :only => [:typeformget, :typeformpost]
	def index
	end	

	def typeformget
		render :json => "Typeform Get called."
	end

	def typeformpost
		puts "Received: #{params}"
		render :json => "Typeform Post called."
	end
end