Class Speak < ActiveRecord::Base
  belongs_to :users
  belongs_to :languages_speak, :through => :speak, :class_name => "Language"
end


