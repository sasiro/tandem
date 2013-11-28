class FixColumnName < ActiveRecord::Migration
  def up
    rename_column :appointments, :avaialbe_id, :available_id
  end

end
