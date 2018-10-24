class CreateSecondPreferences < ActiveRecord::Migration[5.2]
  def change
    create_table :second_preferences do |t|
      t.string :title
    end
    add_column :candidates, :second_preference_id, :integer
  end
end
