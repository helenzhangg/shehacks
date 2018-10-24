class CreateInterests < ActiveRecord::Migration[5.2]
  def change
    create_table :interests do |t|
      t.string :title
    end
    create_table :candidates_interests, id: false do |t|
      t.belongs_to :candidate, index: true
      t.belongs_to :interest, index: true
    end
  end
end
