class AddExperienceToCandidates < ActiveRecord::Migration[5.2]
  def change
    add_column :candidates, :experience, :integer
  end
end
