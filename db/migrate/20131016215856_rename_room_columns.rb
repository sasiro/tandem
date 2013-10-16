class RenameRoomColumns < ActiveRecord::Migration
  def up
    rename_column :rooms, :name, :publisher_id
    rename_column :rooms, :public, :available
  end

  def down
    rename_column :rooms, :publisher_id, :name
    rename_column :rooms, :available, :public
  end
end
