class Available < ActiveRecord::Base
  attr_accessible :day, :duration, :starts, :appointment_attributes
  has_many :appointments
  has_many :users, :through => :appointments
  DAYS = %w[monday tuesday wednesday thursday friday saturnday sunday]
 def start_end_time
    '' +self.starts.strftime("%I:%M%p") + '-' + ((self.starts + self.duration)).strftime("%I:%M%p")+''

  end

end
