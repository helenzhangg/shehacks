class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :firstname, :lastname, :email, :password, :password_digest
      t.boolean :admin, default: :false
      t.integer :access_level, default: 0
    end
  end
end
