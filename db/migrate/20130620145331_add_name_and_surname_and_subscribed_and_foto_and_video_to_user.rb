class AddNameAndSurnameAndSubscribedAndFotoAndVideoToUser < ActiveRecord::Migration
  def up
    add_column :users, :name, :string
    add_column :users, :surname, :string
    add_column :users, :subscribed, :boolean
    add_column :users, :foto, :string
    add_column :users, :video, :string
  end
  def down
    remove_column :users, :name
    remove_column :users, :surname
    remove_column :users, :subscribed
    remove_column :users, :foto
    remove_column :users, :video

  end
end
