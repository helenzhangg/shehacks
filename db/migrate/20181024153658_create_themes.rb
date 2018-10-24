class CreateThemes < ActiveRecord::Migration[5.2]
  def change
    create_table :themes do |t|
      t.string :title
    end
    create_table :candidates_themes, id: false do |t|
      t.belongs_to :candidate, index: true
      t.belongs_to :theme, index: true
    end
  end
end
