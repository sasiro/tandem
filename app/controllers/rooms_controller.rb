class RoomsController < ApplicationController
  before_filter :config_opentok,:except => [:index]
  def index
    @new_room = Room.new
  end

  def new
    #We simulate the form

    session = @opentok.create_session request.remote_addr
    @new_room = Room.new(:name => "nova",:public => false,:sessionId => session.session_id)

    respond_to do |format|
      if @new_room.save
        format.html { redirect_to("/party/"+@new_room.id.to_s) }
      else
        format.html { render :controller => 'user',
                      :action => "tandem" }
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

