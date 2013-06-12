class Interest < ActiveRecord::Base
  attr_accessible :name
  has_many :hobby
  has_many :users, :through => :hobby

end
