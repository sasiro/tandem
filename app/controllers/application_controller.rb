class ApplicationController < ActionController::Base
  protect_from_forgery
  after_filter :store_location

  def store_location
    # store last url as long as it isn't a /users path
    session[:previous_url] = request.fullpath unless request.fullpath =~ /\/users/
  end

  def after_sign_in_path_for(resource)
    user = User.find(current_user.id)
    if user.language?
      tandem_users_path
    else
      language_users_path
    end
  end
end
