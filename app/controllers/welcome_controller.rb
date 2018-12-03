class WelcomeController < ApplicationController

	skip_before_action :verify_authenticity_token, :only => [:typeformget, :typeformpost]
	def index
	end	

	def typeformget
		render :json => "Typeform Get called."
	end

	def typeformpost
		# Declare fields
		fname = ""; lname = ""; email = ""; pronouns = []; roles = []; age = 0
		school = ""; school_type = ""; major = ""; graduation = ""; traveling_from = ""
		proficiencies = []; experience = ""; first_hackathon = false; meaning = ""; resume = ""
		linkedin = ""; github = ""; website = ""; source = ""

		responses = params["form_response"]["answers"]
		form_id = params["form_response"]["form_id"]
		# Make sure this is the correct form
		# TODO: Make IDs ENV vars.
		if form_id == "neFmKu"
			for response in responses
				rid = response["field"]["id"]
				if rid == "Xgz1oZWZy4BC"
					# Firstname
					fname = response["text"]
				elsif rid == "h7BAILpXME4q"
					# Lastname
					lname = response["text"]
				elsif rid == "gIbH4OhT8c1Z"
					# Email
					email = response["email"]
				elsif rid == "k95KR81FT5PX"	
					# Preferred pronouns
					pronouns = response["choices"]["labels"]
				elsif rid == "ey4GBgjOX9J2"
					# Roles they'd like to get involved in
					roles = response["choice"]["label"]
				elsif rid == "GFv0Kh57vhrx"
					# Age
					age = response["number"]
				elsif rid == "ey4GBgjOX9J2"
					# School
					school = response["text"]
				elsif rid == "IPwWQffzIzgy"
					# School type
					school_type = response["choice"]["label"]
				elsif rid == "Z15wX8hzwTFL"
					# Major
					major = response["choice"]["label"]
				elsif rid == "awoUszLyDytN"
					# Year of graduation
					graduation = response["choice"]["label"]
				elsif rid == "ugBoGTDtUGmW"
					# Where are they traveling from?
					traveling_from = response["text"]
				elsif rid == "PR5Z9zE67668"
					# What are they skilled at?
					proficiencies = response["choices"]["labels"]
				elsif rid == "ezwbMtDfXRqt"
					# HExperience in the model--experience is an int for now.
					# How long have they been programming?
					experience = response["choice"]["label"]
				elsif rid == "OQ4qtYEFDrFQ"
					# Is this their first hackathon?
					first_hackathon = response["boolean"]
				elsif rid == "yQ5nzKpp5w06"
					# What does TechTogether mean to them?
					meaning = response["text"]
				elsif rid == "ZixHEc8yiX8Q"
					# Resume
					resume = response["file_url"]
				elsif rid == "rriDAdAPmtDt"
					# LinkedIn
					linkedin = response["text"]
				elsif rid == "ZlNBWDb0vjg2"
					# GitHub
					github = response["text"]
				elsif rid == "oVGZlspBc0AL"
					# Personal Website
					website = response["text"]
				elsif rid == "SqqX82siMBPk"
					# How did they hear about TechTogether?
					source = response["choice"]["label"]
				end
			end
			begin
				Candidate.create(firstname: fname, lastname: lname, email: email, pronouns: pronouns, roles: roles,
					age: age, school: school, school_type: school_type, major: major, graduation: graduation,
					traveling_from: traveling_from, proficiencies: proficiencies, hexperience: experience,
					first_hackathon: first_hackathon, meaning: meaning, resume: resume, linkedin: linkedin,
					github: github, website: website, soruce: source)
			rescue => e
				puts "Error creating candidate: #{e}"
			end
		end
		puts "Received: #{params[:answers]}"
		render :json => "Typeform Post called."
	end
end