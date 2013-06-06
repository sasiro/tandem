class Speak < ActiveRecord::Base
  belongs_to :users
  belongs_to :language_speak, :class_name => "Language"
end


