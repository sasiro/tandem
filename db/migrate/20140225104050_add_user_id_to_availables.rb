class AddUserIdToAvailables < ActiveRecord::Migration
  def change
    add_column :availables, :user_id, :integer
  end
end
