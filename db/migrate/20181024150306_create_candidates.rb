class CreateCandidates < ActiveRecord::Migration[5.2]
  def change
    create_table :candidates do |t|
      t.string :firstname, :lastname, :email
      t.boolean :full_duration
    end
  end
end
