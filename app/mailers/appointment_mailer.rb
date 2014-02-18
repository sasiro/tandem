class AppointmentMailer < ActionMailer::Base
  default from: "info@tandemspot.com", bcc: 'victordp86@gmail.com'
  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.appointment_mailer.appointment_sent.subject
  #

  def appointment_mail_user(user,owner,appointment)
    @user = user
    @owner = owner
    @appointment = appointment
    if @appointment.status == "sent"  
      msj = "requested"  
      mail to: "#{user.name} <#{user.email}>", subject:"You have #{msj} a tandem with #{owner.name}" 
    else 
      msj = @appointment.status 
      mail to: "#{user.name} <#{user.email}>", subject:"#{owner.name} has #{msj} a tandem with you"
    end
  end

  def appointment_mail_owner(user,owner,appointment)
    @user = user
    @owner = owner
    @appointment = appointment
    if @appointment.status == "sent"  
      msj = "requested"  
      mail to: "#{owner.name} <#{owner.email}>", subject:"#{user.name} has #{msj} a tandem with you"
    else 
      msj = @appointment.status 
      mail to: "#{owner.name} <#{owner.email}>", subject:"You have #{msj} a tandem with #{user.name}"
    end
  end
=begin
  def appointment_owner_sent(user,owner,appointment)
    @user = user
    @owner = owner
    @appointment = appointment
    mail to: "#{owner.name} <#{owner.email}>", subject:"#{owner.name} have requested a tandem with you"
  end

  def appointment_starter_sent(user,owner,appointment)
    @user = user
    @owner = owner
    @appointment = appointment
    mail to: "#{user.name} <#{user.email}>", subject:"You have requested a tandem with #{@owner.name}" #TODO change message 
  end

  def appointment_owner_accepted(user,owner,appointment)
    @user = user
    @owner = owner
    @appointment = appointment
    mail to: @owner.email, subject:"You have accepted a tandem request with #{@user.name}."
  end

  def appointment_starter_accepted(user,owner,appointment)
    @user = user
    @owner = owner
    @appointment = appointment
    mail to: @user.email, subject:"You have requested a tandem with #{@owner.name}" #TODO change message 
  end

  def appointment_owner_canceled(user,owner,appointment)
    @user = user
    @owner = owner
    @appointment = appointment
    mail to: @owner.email, subject:"You have canceled a tandem request"
  end

  def appointment_starter_canceled(user,owner,appointment)
    @user = user
    @owner = owner
    @appointment = appointment
    mail to: @user.email, subject:"Your tandem request with #{@owner.name} was canceled" #TODO change message 
  end
=end
  

end
