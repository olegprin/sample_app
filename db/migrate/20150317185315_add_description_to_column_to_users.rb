class AddDescriptionToColumnToUsers < ActiveRecord::Migration
  def change
	  add_column :users, :about_me, :string
	  add_column :users, :age, :string
	  add_column :users, :country, :string
  end
end
