class AddUnverifiedCompanyToUsers < ActiveRecord::Migration
  def change
    add_column :users, :unverified_company, :boolean
  end
end
