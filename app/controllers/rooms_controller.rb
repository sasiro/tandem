class RoomsController < ApplicationController
  before_filter :config_opentok,:except => [:index]
  def index
    @new_room = Room.new
  end

  def new
    room_found = false
    @rooms = Room.where(:public =>true)

    if not @rooms.empty?#to find if there is rooms waiting for a user to join
      @rooms.each do |room|
        user = User.find(room.name)#has to be adapted to de ID
        if not (user.language_improve & current_user.language_speak).empty? and not (user.language_speak & current_user.language_improve).empty? #To make the user with same demanding languages and ofering languages go to the same room
          room.update_attributes(:public => false ) #It can't be accesed again
          room.save!
          session[:partner] = user.id
          redirect_to("/party/"+room.id.to_s)

          room_found = true
          break
        end
      end
    end
    if @rooms.empty? or not room_found # when there is not rooms or if there is not appropiate rooms
      session_properties = {OpenTok::SessionPropertyConstants::P2P_PREFERENCE => "enabled"}
      #session_id = session.session_id
      session = @opentok.create_session request.remote_addr, session_properties

      @new_room = Room.new(:name => current_user.id.to_s,:public => true,:sessionId => session.session_id)

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

    @tok_token = @opentok.generate_token :session_id =>@room.sessionId
  end

  private
  def config_opentok
    if @opentok.nil?
      @opentok = OpenTok::OpenTokSDK.new "7638152", "d1de3d0a7229cc4e46e9a83a1b35f4d14ad6f56b"
    end
  end
end

