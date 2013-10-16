class Room < ActiveRecord::Base
  attr_accessible :publisher_id , :available , :sessionId , :asset
end
