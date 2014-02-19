class RemoveUserStarterFromUsers < ActiveRecord::Migration
  def up
 	remove_column :users, :user_starter, :integer
  end
  def down
  end

end
