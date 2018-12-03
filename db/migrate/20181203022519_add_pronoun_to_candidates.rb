class AddPronounToCandidates < ActiveRecord::Migration[5.2]
  def change
    add_column :candidates, :pronoun, :string
  end
end
