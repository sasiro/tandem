class CreateImproves < ActiveRecord::Migration
  def change
    create_table :improves do |t|
      t.integer :language_improve_id
      t.integer :user_id

      t.timestamps
    end
  end
end
