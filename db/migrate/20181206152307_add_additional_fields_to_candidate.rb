class AddAdditionalFieldsToCandidate < ActiveRecord::Migration[5.2]
  def change
    add_column :candidates, :dietary_restrictions, :string
    add_column :candidates, :tshirt_size, :string
    add_column :candidates, :hackathon_count, :string
    add_column :candidates, :travel_reimbursement_requested, :boolean, default: false
    add_column :candidates, :matching_optin, :boolean, default: false
    add_column :candidates, :foreign_country, :boolean, default: false
    add_column :candidates, :most_experienced, :text
    add_column :candidates, :tinterests, :text
    add_column :candidates, :motivations, :text
    add_column :candidates, :focus, :text
    add_column :candidates, :background_preference, :string
    add_column :candidates, :additional_info, :text
  end
end
