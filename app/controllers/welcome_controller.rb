class WelcomeController < ApplicationController

	skip_before_action :verify_authenticity_token, :only => [:typeformget, :typeformpost, :rsvppost]
	def index
	end	

	def seu

	end

	def parsecsv
		mfile = params[:mfile]
		mc = CSV.read(mfile.tempfile)
		mc = mc.drop(1)
		for item in mc 
				puts "This be: #{item}"
				fname = item[1]
				lname = item[2]
				email = item[3]
				pronouns = []
				age = 0; school = ""; school_type = ""; major = ""; graduation = "";
				traveling_from = ""; hexperience = ""; first_hackathon = false; meaning = "";
				github = ""; linkedin = ""; resume = ""; website = ""; source = ""
				if item[4] != nil
					pronouns.push(item[4])
				end
				if item[5] != nil
					pronouns.push(item[5])
				end
				if item[6] != nil 
					pronouns.push(item[6])
				end
				if item[7] != nil
					pronouns.push(item[7])
				end
				if item[8] != nil
					pronouns.push(item[8])
				end
				if item[9] != nil
					pronouns.push(item[9])
				end
				if item[10] != nil 
					age = item[10]
				end
				if item[11] != nil 
					school = item[11]
				end
				if item[12] != nil 
					school_type = item[12]
				end
				if item[13] != nil 
					major = item[13]
				end
				if item[14] != nil 
					graduation = item[14]
				end
				if item[15] != nil 
					traveling_from = item[15]
				end
				if item[25] != nil 
					hexperience = item[25]
				end
				if item[26] != nil 
					tmp = item[26]
					if tmp == "0"
						first_hackathon = false
					else
						first_hackathon = true
					end
				end
				if item[27] != nil
					meaning = item[27]
				end
				if item[28] != nil 
					resume = item[28]
				end
				if item[29] != nil
					linkedin = item[29]
				end
				if item[30] != nil 
					github = item[30]
				end
				if item[31] != nil 
					website = item[31]
				end
				if item[32] != nil 
					source = item[32]
				end
			begin 
				Candidate.create(firstname: fname, lastname: lname, email: email, pronouns: pronouns,
					age: age, school: school, school_type: school_type, major: major, graduation: graduation,
					traveling_from: traveling_from, hexperience: hexperience,
					first_hackathon: first_hackathon, meaning: meaning, resume: resume, linkedin: linkedin,
					github: github, website: website, source: source)
				puts "Success creating: #{email}"
		rescue => e 
			puts "Error: #{e}"
		end
		end
		
		render :json => "I have: #{mc}"
	end

	def typeformget
		render :json => "Typeform Get called."
	end

	def rsvppost
		# TODO: Input into Candidates model
		# All questions in RSVP Typeform
		# No access to names and emails only
		# Declare fields
		fname = ""; lname = ""; email = ""; dietary_restrictions = ""; tshirt_size = "";
		hackathon_count = ""; full_duration = false; travel_reimbursement_requested = false;
		matching_optin = ""; foreign_country = false; proficiencies = []; most_experienced = [];
		tinterests = []; motivations = []; focus = []; background_preference = "";
		additional_info = ""
		responses = params["form_response"]["answers"]
		form_id = params["form_response"]["form_id"]
		if form_id == "C0wvXW"
			for response in responses
				rid = response["field"]["id"]
				if rid == "bTIgfokIAqzu"
					fname = response["text"]
				elsif rid == "arglSguJWFoX"
					lname = response["text"]
				elsif rid == "ifrTkcLZ3l2V"
					puts "We have: #{response['email']}"
					email = response["email"]
				elsif rid == "Eswwy9RVOoQh"
					dietary_restrictions = response["choice"]["label"]
				elsif rid == "O9fC4aHKi4d7"
					tshirt_size = response["choice"]["label"]
				elsif rid == "FAqGv8rd5aNG"
					hackathon_count = response["choice"]["label"]
				elsif rid == "HvZVspXDbeFu"
					full_duration = response["boolean"]
				elsif rid == "MFVi1haawBsD"
					travel_reimbursement_requested = response["boolean"]
				elsif rid == "TBOOQYuV6lzo"
					foreign_country = response["boolean"]
				elsif rid == "Nx3fJlrXQxSX"
					matching_optin = response["choice"]["label"]
				elsif rid == "QPo7mNzKWEnp"
					# hexperience
					programming_duration = response["choice"]["label"]
				elsif rid == "gLLjjxowcHzu"
					proficiencies = response["choices"]["labels"]
				elsif rid == "A4lbYsnhIeRu"
					most_experienced = response["choices"]["labels"]
				elsif rid == "ahJ7BJQLaPpH"
					focus = response["choices"]["labels"]
				elsif rid == "N11sIuWk4yfL"
					motivations = response["choices"]["labels"]
				elsif rid == "seXwsc4iV7oR"
					tinterests = response["choices"]["labels"]
				elsif rid == "yQRbS4TJKqIA"
					background_preference = response["choice"]["label"]
				elsif rid == "VGRpxJuewo2w"
					additional_info = response["text"]
				end
				begin
					candidate = Candidate.find_by(email: email)
					puts "Email: #{email} and #{fname}"
					if candidate != nil 
						candidate.dietary_restrictions = dietary_restrictions
						candidate.tshirt_size = tshirt_size
						candidate.hackathon_count = hackathon_count
						candidate.full_duration = full_duration
						candidate.travel_reimbursement_requested = travel_reimbursement_requested
						candidate.foreign_country = foreign_country
						candidate.matching_optin = matching_optin
						candidate.hexperience = programming_duration
						candidate.proficiencies = proficiencies
						candidate.most_experienced = most_experienced
						candidate.tinterests = tinterests
						candidate.focus = focus
						candidate.motivations = motivations
						candidate.additional_info = additional_info
						if matching_optin == "Yes, I'd like to get matched!"
						    candidate.matching_optin = true 
						else
							candidate.matching_optin = false
						end
						candidate.save
					end
				rescue => e
					puts "Error updating candidate info: #{e}"
				end
			end
		end
		render :json => "received"
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
				puts "Pronouns: #{pronouns}"
				Candidate.create(firstname: fname, lastname: lname, email: email, pronouns: pronouns, roles: roles,
					age: age, school: school, school_type: school_type, major: major, graduation: graduation,
					traveling_from: traveling_from, proficiencies: proficiencies, hexperience: experience,
					first_hackathon: first_hackathon, meaning: meaning, resume: resume, linkedin: linkedin,
					github: github, website: website, source: source)
			rescue => e
				puts "Error creating candidate: #{e}"
			end
		end
		puts "Received: #{params[:answers]}"
		render :json => "Typeform Post called."
	end
end