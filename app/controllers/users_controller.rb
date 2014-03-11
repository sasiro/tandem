class UsersController < ApplicationController
  #For accessing the helper methods in the index view
  helper_method :sort_column, :sort_direction
  # GET /users
  # GET /users.json
  def index
    @users = User.search(params[:search]).order(sort_column + " " + sort_direction).paginate(:per_page =>15, :page => params[:page])#current_user.compatible_users
    authorize! :read, @users

    respond_to do |format|
      #flash[:alert] = "We are under construction. At the moment you can place the time that you are available to speak. The other people will see it and will practice with you :) "
      format.html # index.html.erb
      format.json { render json: @users }
    end
  end

  def metric

    @users = User.all

    @availables = Available.all.size
    @availables_total = @availables.size

    @appointments = Appointment.all.size


    @appointments_sent = Appointment.where("status = ?","sent").size
    @appointments_accepted = Appointment.where("status = ?","accepted").size
    @appointments_canceled = Appointment.where("status = ?","canceled").size
    @tandem_petitions =  @appointments - @appointments_sent - @appointments_accepted - @appointments_canceled



    respond_to do |format|
      #flash[:alert] = "We are under construction. At the moment you can place the time that you are available to speak. The other people will see it and will practice with you :) "
      format.html # index.html.erb
      format.json { render json: @users }
    end
  end

  # GET /users/1
  # GET /users/1.json
  def show
    @user = User.find(params[:id])

   #authorize! :show, @user
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @user }
    end
  end

  # GET /users/new
  # GET /users/new.json
  def new
    @user = User.new
   authorize! :new, @user
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @user }
    end
  end

  # GET /users/1/edit
  def edit
    @user = User.find(params[:id])
    authorize! :edit, @user
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(params[:user])

   authorize! :create, @user
    respond_to do |format|
      if @user.save
        format.html { redirect_to @user, notice: 'User was successfully created.' }
        format.json { render json: @user, status: :created, location: @user }
      else
        format.html { render action: "new" }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /users/1
  # PUT /users/1.json
  def update
    @user = User.find(params[:id])
   #authorize! :update, @user

    respond_to do |format|
      if @user.update_attributes(params[:user])
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  def language

    @user = User.find(current_user.id)
    authorize! :language, :user
    flash[:notice] = "The cockatiel wants to know about your languages."

  end
  def update_language
    @user = User.find(current_user.id)
    authorize! :update_language, :user
    respond_to do |format|
      if @user.update_attributes(params[:user])
        format.html { redirect_to tandem_users_path, notice: 'You can practice.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end


  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user = User.find(params[:id])
    @user.destroy

    respond_to do |format|
      format.html { redirect_to users_url }
      format.json { head :no_content }
    end
  end

  def tandem

    @available = Available.new
    @user = User.find(current_user.id)
    @appointments = @user.get_appointments
    authorize! :tandem, :user
    @availables = current_user.availables
   # authorize! :tandem, @user

  end

  def find
    respond_to do |format|
      format.html { redirect_to users_url, alert: 'We are under construcion. At the moment you can see the other uses avaiable time at'  }
      format.json { head :no_content }
    end
  #appointments = Appointment.find_by_user_id(current_user.id)

  #@all_ids = User.pluck(:id)
  #@selected_page = params[:page] || session[:page] || 0
  #ids = @all_ids.slice( @selected_page * 2 , 2 )
  #@users = User.where(id: ids)
  #@user = User.first
  #authorize! :find, :user
  end
private
#For ordering users in the view index
def sort_column
 User.column_names.include?(params[:sort]) ? params[:sort] : "name"

end

#If the params[direction] is include in [asc,desc] we pass this parameter. Else we pass "asc"
def sort_direction
  %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
end


end
