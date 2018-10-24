class AddAgeToCandidates < ActiveRecord::Migration[5.2]
  def change
    add_column :candidates, :age, :integer
    add_column :candidates, :preferred_age, :string
  end
end
