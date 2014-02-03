class OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def all
    user = User.from_omniauth(request.env["omniauth.auth"] , request.env["omniauth.params"])

    if user.persisted?
      flash.notice = "Signed in!"
      sign_in_and_redirect user
    else
      session["devise.user_attributes"] = user.attributes
       if user.valid?
        flash[:just_signed_up] = true
       end
      redirect_to new_user_registration_url
    end
  end

  alias_method :facebook, :all
end
