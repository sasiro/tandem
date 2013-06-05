class CreateSpeaks< ActiveRecord::Migration
  def self.up
    create_table :speaks do |t|
      t.integer :user_id
      t.integer :language_id

      t.timestamps
    end
  end

  def self.down
    drop_table :speaks
  end
end
