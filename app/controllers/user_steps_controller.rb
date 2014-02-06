class UserStepsController < ApplicationController
  include Wicked::Wizard
  steps :personal, :validated



  def show
    @user = current_user
    case step
      when :validated
        @url_shared="http://tandemspot.com/?utm_medium=Social Media&utm_source=Facebook&utm_campaign=#{current_user.uid}"
      end
    render_wizard
  end

  def update
    @user = current_user
    @user.attributes = params[:user]
    #case step
    # when :personal
    #   if Coupon.used?(params[:user]["code"])#To validate users that has an access code
    #     cup = Coupon.find_by_code(params[:user]["code"])
    #     cup.user_id = current_user.id
    #     cup.save
    #     @user.validated = true
    #   end
    # end
    render_wizard @user#It calls to save and goes to the next step. If it fails renders the current step again
  end
  private
  def finish_wizard_path
    availables_path
  end

end
