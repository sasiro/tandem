class AddValidatedToUsers < ActiveRecord::Migration
  def  up
    add_column :users, :validated, :boolean
  end
  def down
    remove_column :users, :validated, :boolean
  end
end
