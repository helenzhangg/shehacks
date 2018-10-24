class AddAspirationToCandidates < ActiveRecord::Migration[5.2]
  def change
    create_table :aspirations do |t|
      t.string :title
    end
    create_table :aspirations_candidates, id: false do |t|
      t.belongs_to :candidate, index: true
      t.belongs_to :aspiration, index: true
    end
  end
end
