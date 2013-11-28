class CreateAppointments < ActiveRecord::Migration
  def up
    create_table :appointments do |t|
      t.integer :user_id
      t.integer :avaialbe_id
      t.string :status

      t.timestamps
    end
  end
  def down
    drop_table :appointments
  end
end
