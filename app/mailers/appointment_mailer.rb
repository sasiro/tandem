class AppointmentMailer < ActionMailer::Base
  default from: "info@tandemspot.com", bcc: 'info@tandemspot.com'
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
      @text1 = "Hello #{@user.name},<br /> <br /> Your tandem request have been sent to <b>#{@owner.name}</b> :)"  
      @text2 = "#{@day} <br />#{@time}"
      @text3 = "While you wait for #{@owner.name}'s confirmation you can meet some other interesting people"
      @img1 = "bt.png"
     @language_improve = ""
      @owner.language_improve.each  { |lang| @language_improve += lang.name + " "}
      @language_speak = ""
      @owner.language_speak.each  { |lang| @language_speak += lang.name + " "}
      msj = "requested"  
      mail to: "#{user.name} <#{user.email}>", subject:"You have #{msj} a tandem with #{owner.name}" 
    elsif @appointment.status == "accepted"
      @text1 = "Hello #{@user.name},<br /> <br /> Your tandem with #{@owner.name} has been accepted! :) "  
      @text2 = "#{@day} <br />#{@time}"
      @text3 = "Remember to login to Tandem Spot 10 minutes before your appointment and go to Speak Now"
      @img1 = "bt.png"
      msj = @appointment.status 
      
      mail to: "#{user.name} <#{user.email}>", subject:"#{owner.name} has #{msj} a tandem with you"
    elsif @appointment.status == "canceled"
      @text1 = "Hello #{@user.name},<br /> <br /> Your tandem  has been canceled!"  
      @text2 = "Canceled"
      @text3 = "No worries there are a looot of users looking for more language exchanges in Tandem Spot"
      @img1 = "bt3.png"
      
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
      @text1 = "Hello #{@owner.name},<br /> <br /> Congratulations you have a tandem request! :) \n <b>#{@user.name}</b> wants to speak with you."  
      @text2 = "#{@day} <br />#{@time}"
      @text3 = "Remember to log in Tandem Spot 10 minutes before your appointment and go to Speak Now"
      @img1 = "bt2.png"
      msj = "requested" 
      @language_improve = ""
      @user.language_improve.each  { |lang| @language_improve += lang.name + " "}
      @language_speak = ""
      @user.language_speak.each  { |lang| @language_speak += lang.name + " "}
       
      mail to: "#{owner.name} <#{owner.email}>", subject:"#{user.name} has #{msj} a tandem with you"
     
    elsif @appointment.status =="accepted"
      @text1 = "Hello #{@owner.name},<br /> <br /> You have accepted a tandem with #{@user.name}! :) "  
      @text2 = "#{@day} <br />#{@time}"
      @text3 = "Remember to login to Tandem Spot 10 minutes before your appointment and go to Speak Now"
      @img1 = "bt.png"
      msj = @appointment.status 
      mail to: "#{owner.name} <#{owner.email}>", subject:"You have #{msj} a tandem with #{user.name}"
    elsif @appointment.status =="canceled"
      @text1 = "Hello #{@owner.name},<br /> <br /> You have refused a tandem. We hope that you are busy doing funny things and you are not delaying your language learning forever... "  
      @text2 = "Canceled!"
      @text3 = "We are sure that you can find a great language partner that fits you."
      @img1 = "bt3.png"
      msj = @appointment.status 
      mail to: "#{owner.name} <#{owner.email}>", subject:"You have #{msj} a tandem with #{user.name}"
    end
  end

end
