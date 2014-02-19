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
    @time = appointment.time
    @day = appointment.day
    if @appointment.status == "sent"
      @text1 = "Hello #{@user.name},<br /> <br /> Your tandem request have been sent to #{@owner.name} :)"  
      @text2 = "#{@day} <br />#{@time}"
      @text3 = "While you wait for #{@owner.name}'s confirmation you can meet some other interesting people"
     
      msj = "requested"  
      mail to: "#{user.name} <#{user.email}>", subject:"You have #{msj} a tandem with #{owner.name}" 
    elsif @appointment.status == "accepted"
      @text1 = "Hello #{@user.name},<br /> <br /> Your tandem with #{@user.name} have been accepted! :) "  
      @text2 = "#{@day} <br />#{@time}"
      @text3 = "Remember to login to Tandem Spot 10 minutes before your appointment and go to Speak Now"
      msj = @appointment.status 
      
      mail to: "#{user.name} <#{user.email}>", subject:"#{owner.name} has #{msj} a tandem with you"
    elsif @appointment.status == "canceled"
      @text1 = "Hello #{@user.name},<br /> <br /> Your tandem  has been canceled!"  
      @text2 = "Canceled"
      @text3 = "No worries there are a looot of users looking for more language exchanges in Tandem Spot"
      
      msj = @appointment.status 
      mail to: "#{user.name} <#{user.email}>", subject:"#{owner.name} has #{msj} a tandem with you"
    end
  end

  def appointment_mail_owner(user,owner,appointment)
    @user = user
    @owner = owner
    @appointment = appointment
    @time = appointment.time
    @day = appointment.day
    if @appointment.status == "sent" 
      @text1 = "Hello #{@owner.name},<br /> <br /> Congratulations you have a tandem request! :) \n #{@user.name} wants to speak with you."  
      @text2 = "#{@day} <br />#{@time}"
      @text3 = "Remember to login to Tandem Spot 10 minutes before your appointment and go to Speak Now"
      msj = "requested"  
      mail to: "#{owner.name} <#{owner.email}>", subject:"#{user.name} has #{msj} a tandem with you"
    elsif @appointment.status =="accepted"
      @text1 = "Hello #{@owner.name},<br /> <br /> You have accepted a tandem with #{@user.name}! :) "  
      @text2 = "#{@day} <br />#{@time}"
      @text3 = "Remember to login to Tandem Spot 10 minutes before your appointment and go to Speak Now"
      msj = @appointment.status 
      mail to: "#{owner.name} <#{owner.email}>", subject:"You have #{msj} a tandem with #{user.name}"
    elsif @appointment.status =="canceled"
      @text1 = "Hello #{@owner.name},<br /> <br /> You have refused a tandem. We hope that you are busy doing funny things and you are not delaying your language learning forever... "  
      @text2 = "Canceled!"
      @text3 = "We are sure that you can find a great language partner that fits you."
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
