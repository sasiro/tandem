class RoomsController < ApplicationController
  before_filter :config_opentok,:except => [:index]
  def index
    authorize! :update, @room
    @rooms = Room.page(params[:page]).per_page(15)
    @all_rooms = Room.all
    @iniciated_rooms = 0
    @all_rooms.map{|room| @iniciated_rooms+=1 if  room.available}
  end
  def new

    room_found = false
    @rooms = Room.where(:available =>true).order('created_at ASC')


    if not @rooms.empty?#to find if there is rooms waiting for a user to join
      @rooms.each do |room|
        debugger
        user = User.find(room.publisher_id)#has to be adapted to de ID
        if not (user.language_improve & current_user.language_speak).empty? and not (user.language_speak & current_user.language_improve).empty? #To make the user with same demanding languages and ofering languages go to the same room
          room.update_attributes(:available => false ) #It can't be accesed again
          room.save!
          redirect_to("/party/"+room.id.to_s)

          room_found = true
          break
        end
      end
    end
    if @rooms.empty? or not room_found # when there is not rooms or if there is not appropiate rooms
      #p2p conexion#session_properties = {OpenTok::SessionPropertyConstants::P2P_PREFERENCE => "enabled"}
      #session = @opentok.create_session request.remote_addr, session_properties

      session = @opentok.create_session request.remote_addr
      @new_room = Room.new(:publisher_id => current_user.id.to_s, :available => true,:session_id => session.session_id)

      respond_to do |format|
        if @new_room.save
          format.html { redirect_to("/party/"+@new_room.id.to_s) }
        else
          format.html { render :controller => 'user',
                        :action => "tandem" }
        end
      end
    end
  end
  def party
    @room = Room.find(params[:id])
    @tok_token = @opentok.generate_token :session_id =>@room.session_id, :expire_time => Time.now.to_i + 60*60

  end


  def show
    id = params[:id]
    @room = Room.find(id)
    render :partial => 'room', :locals => {:room => @room} and
      return if request.xhr?
  end

  def close
    @room = Room.find(params[:id])
    authorize! :close, :room
    if @room.update_attribute(:available, false)
      render("/users/tandem")
    else
      redirect :controller => 'rooms', :action => "tandem"
    end
  end

  private
  def config_opentok

    if @opentok.nil?
      @opentok = OpenTok::OpenTokSDK.new "7638152", "d1de3d0a7229cc4e46e9a83a1b35f4d14ad6f56b"
    end
  end


  end

