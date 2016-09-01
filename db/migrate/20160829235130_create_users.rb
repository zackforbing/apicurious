class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string :uid
      t.string :name
      t.string :username
      t.string :token
      t.string :avatar
      t.string :email

      t.timestamps
    end
  end
end
