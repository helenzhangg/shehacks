class AddAexperienceToCandidates < ActiveRecord::Migration[5.2]
  def change
    add_column :candidates, :aexperience, :text
  end
end
