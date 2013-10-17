class AddSubscriberIdAndJoinedAtAndDurationAndFinishedAndCommentsAndErrorAndSubscriberLanguageAndPublisherLanguage < ActiveRecord::Migration
  def up

    add_column :rooms, :subscriber_id, :integer
    add_column :rooms, :joined_at, :datatime
    add_column :rooms, :duration, :datatime
    add_column :rooms, :finished, :boolean
    add_column :rooms, :comments, :string
    add_column :rooms, :error, :string
    add_column :rooms, :subscriber_speak_id, :integer
    add_column :rooms, :publisher_speak_id, :integer

  end

  def down
    remove_column :rooms, :subscriber_id
    remove_column :rooms, :joined_at
    remove_column :rooms, :duration
    remove_column :rooms, :finished
    remove_column :rooms, :comments
    remove_column :rooms, :error
    remove_column :rooms, :subscriber_speak_id
    remove_column :rooms, :publisher_speak_id
  end
end
