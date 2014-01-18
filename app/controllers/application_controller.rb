class ApplicationController < ActionController::Base
  protect_from_forgery
  after_filter :store_location

  def store_location
    # store last url as long as it isn't a /users path
    session[:previous_url] = request.fullpath unless request.fullpath =~ /\/users/
  end

  rescue_from CanCan::AccessDenied do |exception|
    redirect_to root_path, :alert => exception.message
  end

  def after_sign_in_path_for(resource)
    user = User.find(current_user.id)
    if user.sign_in_count == 1 or  not user.valid?
      user_steps_path
    elsif user.appointments.empty?
      availables_path
    else
      tandem_users_path
    end
  end

 # def after_sign_in_path_for(resource)
    #user = User.find(current_user.id)
    #if user.language?
      ##tandem_users_path
      #user_steps_path
    #else
      #language_users_path
    #end
  #end

end
