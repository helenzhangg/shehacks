class CreateEducation < ActiveRecord::Migration[5.2]
  def change
    create_table :educations do |t|
      t.string :title
    end
    add_column :candidates, :education_id, :integer
  end
end
