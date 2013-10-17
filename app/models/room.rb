class Room < ActiveRecord::Base
  attr_accessible :publisher_id , :available , :session_id , :asset
end
