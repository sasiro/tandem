class AppointmentsController < ApplicationController
  # GET /appointments
  # GET /appointments.json
  def index
    @appointments = Appointment.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @appointments }
    end
  end

  # GET /appointments/1
  # GET /appointments/1.json
  def show
    @appointment = Appointment.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @appointment }
    end
  end

  # GET /appointments/new
  # GET /appointments/new.json
  def new
    @appointment = Appointment.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @appointment }
    end
  end

  # GET /appointments/1/edit
  def edit
    @appointment = Appointment.find(params[:id])
  end

  # POST /appointments
  # POST /appointments.json
  def create
    @appointment = Appointment.new(params[:appointment])
    @appointment.status = "sent"
    @appointment.user_id = Available.find(@appointment.available_id).user_id
    @appointment.user_starter = current_user.id
    @owner = User.find(@appointment.user_id)
    @user = User.find(@appointment.user_starter)
    respond_to do |format|
      if @appointment.save

        AppointmentMailer.appointment_mail_owner( @user,@owner, @appointment).deliver unless Rails.env.test?
        AppointmentMailer.appointment_mail_user( @user, @owner, @appointment).deliver unless Rails.env.test?

        format.html { redirect_to users_path, notice: 'Good. You have sent an appointment, check your email!!'}
        format.json { render json: users_path, status: :created, location: @appointment }

        $customerio.track(current_user.id, "appointment",:type => "created",:status => @appointment.status)

      else
        format.html { render action: "new" }
        format.json { render json: @appointment.errors, status: :unprocessable_entity }
      end
    end
  end
  def update
    debugger
    @appointment = Appointment.find(params[:id])
    @owner = User.find(@appointment.user_id)#to get the email of the owner of the appointment
    @user = User.find(@appointment.user_starter)

=begin
    if not @appointment.user_starter.nil?
      @user_starter = User.find(@appointment.user_starter)
    end

    if params[:appointment][:status] == "sent"

      @appointment.user_starter = current_user.id
      @user_starter = current_user
    end
=end
    respond_to do |format|
      if @appointment.update_attributes(params[:appointment])

        #First version. Change
        $customerio.track(current_user.id, "appointment",:type => "updated",:status => @appointment.status)
        $customerio.track(@owner.id , "appointment",:type => "updated",:status => @appointment.status)
        #24 h before the appointment
        AppointmentMailer.appointment_mail_owner(@user, @owner, @appointment).deliver unless Rails.env.test?
        AppointmentMailer.appointment_mail_user(@user, @owner, @appointment).deliver unless Rails.env.test?
        redirect_page = users_path
        msj = "Ok, you have #{@appointment.status} an appointment"
        format.html { redirect_to redirect_page, notice: msj }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @appointment.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @appointment = Appointment.find(params[:id])
    @appointment.destroy

    respond_to do |format|
      format.html { redirect_to appointments_url }
      format.json { head :no_content }
    end
  end
end




  # PUT /appointments/1
  # PUT /appointments/1.json
=begin
  def update
    @appointment = Appointment.find(params[:id])
    @owner = User.find(@appointment.user_id)#to get the email of the owner of the appointment
    @user_starter = User.find(@appointment.user_starter) unless @appointment.user_starter.nil?
    if params[:appointment][:status] == "sent"
      @appointment.user_starter = current_user.id
      @user_starter = current_user
    end
    respond_to do |format|
      if @appointment.update_attributes(params[:appointment])
        if params[:appointment][:status] == "sent"
          AppointmentMailer.appointment_owner_sent(@user_starter, @owner, @appointment).deliver unless Rails.env.test?
          AppointmentMailer.appointment_starter_sent(@user_starter, @owner, @appointment).deliver unless Rails.env.test?

          msj = "Okay, so you have a pending appointment."
          redirect_page = users_path
        elsif params[:appointment][:status] == "accepted"
          AppointmentMailer.appointment_owner_accepted(@user_starter, @owner, @appointment).deliver unless Rails.env.test?
          AppointmentMailer.appointment_starter_accepted(@user_starter, @owner, @appointment).deliver unless Rails.env.test?
          msj = "You have accepted a new appointment."
          redirect_page = appointments_path
        elsif params[:appointment][:status] == "canceled"
          AppointmentMailer.appointment_owner_canceled(@user_starter, @owner, @appointment).deliver unless Rails.env.test?
          AppointmentMailer.appointment_starter_canceled(@user_starter, @owner, @appointment).deliver unless Rails.env.test?
          msj = "Okay, so you have canceled an appointment."
          redirect_page = appointments_path
        else
          msj = "Okay, you have updated and appointment."
          redirect_page = appointments_path
        end
        format.html { redirect_to redirect_page, notice: msj }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @appointment.errors, status: :unprocessable_entity }
      end
    end
  end
=end
  # DELETE /appointments/1
  # DELETE /appointments/1.json








