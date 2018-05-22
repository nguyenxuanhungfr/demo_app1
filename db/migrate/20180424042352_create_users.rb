class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :name
      t.string :email, unique: true
      t.timestamps
      t.string :password_digest
      t.string :remember_digest
      t.boolean :admin, default: false
    end
  end
end
