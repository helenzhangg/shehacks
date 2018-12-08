class AddResearcherToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :researcher, :boolean, default: false
  end
end
