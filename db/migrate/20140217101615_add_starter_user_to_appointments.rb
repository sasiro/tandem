class AddStarterUserToAppointments < ActiveRecord::Migration
  def change
  	add_column :appointments, :user_starter, :integer 
  end
end
