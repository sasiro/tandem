class ChangeUserIdAndAvailableIdToAppointntments < ActiveRecord::Migration
  def change
      remove_column :appointments, :available_id
      remove_column :appointments, :user_id
    change_table :appointments do |t|
      t.belongs_to :user
      t.belongs_to :available
    end
  end

end
