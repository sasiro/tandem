class Available < ActiveRecord::Base
  attr_accessible :day, :duration, :starts

  has_many :appointment
  has_many :user, :through => :appointment

 def start_end_time
    '' +self.starts.strftime("%I:%M%p") + '-' + (self.starts + 1.hour).strftime("%I:%M%p")+''

  end

end
