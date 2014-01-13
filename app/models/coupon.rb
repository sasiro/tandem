class Coupon < ActiveRecord::Base
  attr_accessible :code
  belongs_to :user
  def self.used?(string)
   Coupon.find_by_code(string)
  end
end
