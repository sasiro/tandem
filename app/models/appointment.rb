class Appointment < ActiveRecord::Base
  attr_accessible :available_id, :status, :user_id
  belongs_to :user
  belongs_to :available
  def self.pending(current_user) #Counts all sent appointments and shows it on navbar
    @appointments = Appointment.find_all_by_user_id(current_user.id)
    counter = 0
    @appointments.map{ |app| counter += 1  if app.status == "sent"}
    return counter
  end
  def owned(report)
    current_user.id == appointment.user_id
  end
 end
