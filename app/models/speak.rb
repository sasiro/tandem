class Speak < ActiveRecord::Base
 # belongs_to :users
  belongs_to :language_speak, :class_name => "Language"
  attr_accessible :language_speak_id, :user_id
end


