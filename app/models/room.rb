class Room < ActiveRecord::Base
  attr_accessible :name , :public , :sessionId , :asset
end
