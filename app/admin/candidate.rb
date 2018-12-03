ActiveAdmin.register Candidate do
  permit_params :firstname, :lastname, :experience, :education, :first_preference,
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
  	column :education
    column :experience
  end

   show do
    attributes_table do
      if current_user.access_level > 2
        row :firstname
        row :lastname
        row ("Email") {raw("<a href='mailto: #{candidate.email}'>#{candidate.email}</a>")}
      end
      row :experience
      row :education
      row :first_preference
      row :second_preference
      row "Preferred Education" do |person|
        (person.preferred_education.map{|p| raw("<a href='#' target='_blank'>#{p.title}</a>")}).join(', ').html_safe
      end

      row "Preferred Skills" do |person|
        (person.preferred_skills.map{|p| raw("<a href='#' target='_blank'>#{p.title}</a>")}).join(', ').html_safe
      end

      active_admin_comments
    end
  end

  # if current_user.access > 2
  #   filter(:firstname)
  #   filter(:lastname)
  #   filter(:email)
  # end

  filter(:preferred_skills, {
  as: :select,
  multiple: true,
  input_html: {
    class: :select2,
    style: "width: 100%;"
  },
  label: "Preferred Skills"
})

  filter(:peducations, {
  as: :select,
  multiple: true,
  input_html: {
    class: :select2,
    style: "width: 100%;"
  },
  label: "Preferred Education"
})
  filter(:experience)
  filter(:first_preference)
  filter(:second_preference)
end