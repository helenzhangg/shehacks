class CreateFirstPreferences < ActiveRecord::Migration[5.2]
  def change
    create_table :first_preferences do |t|
      t.string :title
    end
    add_column :candidates, :first_preference_id, :integer
  end
end
