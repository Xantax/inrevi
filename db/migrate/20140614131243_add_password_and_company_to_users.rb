class AddPasswordAndCompanyToUsers < ActiveRecord::Migration
  def change
    add_column :users, :company, :boolean
    add_column :users, :password_digest, :string
    add_column :users, :remember_token, :string
    add_column :users, :image_auth, :string
    add_index :users, :remember_token
    add_index :users, :email
  end
end
