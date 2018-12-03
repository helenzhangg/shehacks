class AddRolesToCandidates < ActiveRecord::Migration[5.2]
  def change
    add_column :candidates, :roles, :string
  end
end
