class AddSchoolToCandidates < ActiveRecord::Migration[5.2]
  def change
    add_column :candidates, :school, :string
    add_column :candidates, :school_type, :string
    add_column :candidates, :major, :string
    add_column :candidates, :graduation, :string
    add_column :candidates, :traveling_from, :string
    add_column :candidates, :proficiencies, :text
    add_column :candidates, :first_hackathon, :boolean
    add_column :candidates, :meaning, :text
    add_column :candidates, :resume, :string
    add_column :candidates, :linkedin, :string
    add_column :candidates, :github, :string
    add_column :candidates, :website, :string
    add_column :candidates, :source, :string
  end
end
