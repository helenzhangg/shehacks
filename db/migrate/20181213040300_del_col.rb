class DelCol < ActiveRecord::Migration[5.2]
  def change
    remove_column :candidates, :aexperience
  end
end
