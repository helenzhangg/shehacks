class AddHexperienceToCandidates < ActiveRecord::Migration[5.2]
  def change
    add_column :candidates, :hexperience, :string
  end
end
