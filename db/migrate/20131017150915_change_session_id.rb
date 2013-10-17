class ChangeSessionId < ActiveRecord::Migration
  def up
    rename_column :rooms, :sessionId, :session_id
  end

  def down
    rename_column :rooms, :session_id, :sessionId
  end
end
