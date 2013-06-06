class CreateSpeaks < ActiveRecord::Migration
  def change
    create_table :speaks do |t|
      t.integer :language_speak_id
      t.integer :user_id

      t.timestamps
    end
  end
  def self.down
    drop_table :speaks
  end
end
