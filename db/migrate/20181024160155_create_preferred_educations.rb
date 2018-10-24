class CreatePreferredEducations < ActiveRecord::Migration[5.2]
  def change
    create_table :peducations do |t|
      t.string :title
    end
    create_table :candidates_peducations, id: false do |t|
      t.belongs_to :candidate, index: true
      t.belongs_to :peducation, index: true
    end
  end
end
