class Improve < ActiveRecord::Base
  belongs_to :users
  belongs_to :language_improve, :class_name => "Language"
end
