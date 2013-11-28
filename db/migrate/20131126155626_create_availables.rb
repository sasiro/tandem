class CreateAvailables < ActiveRecord::Migration
  def up
    create_table :availables do |t|
      t.string :day
      t.time :starts
      t.time :duration

      t.timestamps
    end
  end

 def down
    drop_table :availables
  end
end
