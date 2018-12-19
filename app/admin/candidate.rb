ActiveAdmin.register Candidate do 
  permit_params :firstname, :lastname, :experience, :school, :proficiencies,
  :second_preference, peducations: [], preferred_skills: []

  
 scope :corr, :default => true do |c|
  if current_user.researcher
    c.corr
  else
    c.all
  end
  end
  

  index do 
   
  	selectable_column
    
  	column "Id" do |candidate|
      if current_user.researcher
        candidate.id 
      else
  		  raw("<a href='/summary/candidates/#{candidate.id}'>#{candidate.id}</a>")
      end
  	end
    if current_user.access > 2
  	  column :firstname
  	  column :lastname
  	  column :email
    end
  	column :school
    column "Experience" do |c|
      c.hexperience
    end
    
  end

  csv do
    
      
        column "Id" do |c| 
          c.id
        end 
        column :full_duration
        column "Experience" do |c|
          c.hexperience
        end
        column :age
        column :pronouns 
        column :school
        column :school_type
        column :major
        column :graduation
        column :traveling_from
        column :proficiencies
        column :first_hackathon
        column :meaning
        column :source
        column "Areas of Experience" do |c|
          c.most_experienced
        end
        column :focus
        column :motivations
        column :background_preference
        column "How many hackathons have you been to before?" do |c|
          c.hackathon_count
        end
        column "Which of these topics interests you most?" do |c|
          c.tinterests
        end
        column :additional_info
  end

   show do
    attributes_table do
      if current_user.access_level > 2
        row :firstname
        row :lastname
        row ("Email") {raw("<a href='mailto: #{candidate.email}'>#{candidate.email}</a>")}
      end
      row ("Experience") {candidate.hexperience}
      row :school
      row :school_type
      row :graduation
      row :major
      row :traveling_from
      row ("What does TechTogether mean to them?") {candidate.meaning}
      row ("Preferred Pronouns") {candidate.pronouns}
      row ("First Hackathon?") {candidate.first_hackathon ? "Yes" : "No"}
      row ("Skills") {candidate.proficiencies}
      row ("How did they hear about TechTogether?") {candidate.source}
      row ("Github") {(candidate.github != "" and candidate.github != nil)? raw("<a href='#{candidate.github}' target='_blank'>#{candidate.github}</a>") : "No link provided."}
      row ("Linkedin") {(candidate.linkedin != "" and candidate.linkedin != nil) ? raw("<a href='#{candidate.linkedin}' target='_blank'>#{candidate.linkedin}</a>") : "No link provided."}
      row ("Personal Website") {(candidate.website != nil and candidate.website != "") ? raw("<a href='#{candidate.website}' target='_blank'>#{candidate.website}</a>") : "No link provided."}
      row ("Resume") {(candidate.resume != "" and candidate.resume != nil) ? raw("<a href='#{candidate.resume}' target='_blank'>#{candidate.resume}</a>") : "No resume on file."}
      # row "Preferred Education" do |person|
      #   (person.preferred_education.map{|p| raw("<a href='#' target='_blank'>#{p.title}</a>")}).join(', ').html_safe
      # end

      # row "Preferred Skills" do |person|
      #   (person.preferred_skills.map{|p| raw("<a href='#' target='_blank'>#{p.title}</a>")}).join(', ').html_safe
      # end

      active_admin_comments
    end
  end

  # if current_user.access > 2
  #   filter(:firstname)
  #   filter(:lastname)
  #   filter(:email)
  # end

#   filter(:preferred_skills, {
#   as: :select,
#   multiple: true,
#   input_html: {
#     class: :select2,
#     style: "width: 100%;"
#   },
#   label: "Preferred Skills"
# })

#   filter(:peducations, {
#   as: :select,
#   multiple: true,
#   input_html: {
#     class: :select2,
#     style: "width: 100%;"
#   },
#   label: "Preferred Education"
# })
  # filter(:experience)
  # filter(:first_preference)
  # filter(:second_preference)
end