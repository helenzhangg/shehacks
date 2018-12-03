ActiveAdmin.register Candidate do
  permit_params :firstname, :lastname, :experience, :school, :proficiencies,
  :second_preference, peducations: [], preferred_skills: []

  index do
  	selectable_column
  	column "Id" do |candidate|
  		raw("<a href='/summary/candidates/#{candidate.id}'>#{candidate.id}</a>")
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
      row ("Preferred Pronouns") {candidate.pronouns}
      row ("First Hackathon?") {candidate.first_hackathon ? "Yes" : "No"}
      row ("Skills") {candidate.proficiencies}
      row ("How did they hear about TechTogether?") {candidate.source}
      row ("Github") {(candidate.github != "" and candidate.github != nil)? raw("<a href='#{candidate.github}' target='_blank'>#{candidate.github}</a>") : "No link provided."}
      row ("Linkedin") {(candidate.linkedin != "" and candidate.linkedin != nil) ? raw("<a href='#{candidate.linkedin}' target='_blank'>#{candidate.linkedin}</a>") : "No link provided."}
      row ("Personal Website") {(candidate.website != nil and candidate.website != "") ? raw("a href='#{candidate.website}' target='_blank'>#{candidate.website}</a>") : "No link provided."}
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