class AvailablesController < ApplicationController
  # GET /availables
  # GET /availables.json
  def index
    @available = Available.new
    @availables = current_user.availables

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @availables }
    end
  end

  # GET /availables/1
  # GET /availables/1.json
  def show
    @available = Available.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @available }
    end
  end

  # GET /availables/new
  # GET /availables/new.json
  def new
    @available = Available.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @available }
    end
  end

  # GET /availables/1/edit
  def edit
    @available = Available.find(params[:id])
  end

  # POST /availables
  # POST /availables.json
  def create
   $customerio.track(current_user.id, "availables",:type => "created")
   days = params[:available][:day].reject! { |c| c.empty? }
   days.empty? ? all_record_saved = false : all_record_saved = true
   days.each do |day|
     available = Available.new("day"=>day, "starts"=>params[:available][:starts])
     if available.save!
      current_user.availables << available
     else
      all_record_saved = false
     end
  end
  respond_to do |format|
    if all_record_saved
      format.html { redirect_to :back }
    else
      format.html { redirect_to :back, alert: 'Maybe some hours have not been added, check them out' }
    end
  end

end

  # PUT /availables/1
  # PUT /availables/1.json
  def update
    $customerio.track(current_user.id, "availables",:type => "updated")

    @available = Available.find(params[:id])

    respond_to do |format|
      if @available.update_attributes(params[:available])
        format.html { redirect_to @available, notice: 'Available was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @available.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /availables/1
  # DELETE /availables/1.json
  def destroy
    @available = Available.find(params[:id])
    @available.destroy

    respond_to do |format|
      format.html { redirect_to availables_url }
      format.json { head :no_content }
    end
  end
end
