class PreferredSkills < ActiveRecord::Migration[5.2]
  def change
    create_table :preferred_skills do |t|
      t.string :title
    end
    create_table :candidates_preferred_skills, id: false do |t|
      t.belongs_to :candidate, index: true
      t.belongs_to :preferred_skill, index: true
    end
  end
end
