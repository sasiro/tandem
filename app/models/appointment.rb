class Appointment < ActiveRecord::Base
  attr_accessible :available_id, :status, :user_id
  belongs_to :user
  belongs_to :available

 end
