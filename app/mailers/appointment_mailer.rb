class AppointmentMailer < ActionMailer::Base
  default from: "info@tandemspot.com"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.appointment_mailer.appointment_sent.subject
  #
  def appointment_sent(user,owner,appointment)
    @user = user
    @owner = owner
    @appointment = appointment
    mail to: user.email, subject:"Request for practice language with you"
  end
end
