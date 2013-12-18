class Available < ActiveRecord::Base
  attr_accessible :day, :duration, :starts
  has_many :appointments, dependent: :destroy
  has_many :users, :through => :appointments
  DAYS = %w[Monday Tuesday Wednesday Thursday Friday Saturday Sunday]
  def start_end_time
    '' +self.starts.strftime("%I:%M%p") + '-' + ((self.starts + self.duration)).strftime("%I:%M%p")+''

  end

end
