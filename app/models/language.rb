class Language < ActiveRecord::Base
  attr_accessible :name
  has_many :speak
  has_many :users, :through => :speak
  has_many :improve
  has_many :users, :through => :improve
end
