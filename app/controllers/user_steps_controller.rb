class UserStepsController < ApplicationController
  include Wicked::Wizard
  steps :personal, :language_speak, :language_improve,:interest


  def show
    @user = current_user
    render_wizard
  end

  def update
    @user = current_user
    @user.attributes = params[:user]
    render_wizard @user#It calls to save and goes to the next step. If it fails renders the current step again
  end
  private
  def finish_wizard_path
    tandem_users_path
  end

end
