class Improve < ActiveRecord::Base
  #belongs_to :users
  belongs_to :language_improve, :class_name => "Language"
  attr_accessible :language_improve_id, :user_id
end
