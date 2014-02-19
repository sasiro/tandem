class RemoveUserStarterFromUsers < ActiveRecord::Migration
  def change
 	remove_column :users, :user_starter, :integer
  end


end
