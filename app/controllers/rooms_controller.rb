class RoomsController < ApplicationController
  def index
    @current_user = current_user
    redirect_to new_user_registration_path unless @current_user
    @rooms = Room.public_rooms
    @users = User.all_except(@current_user)
    @room = Room.new
  end

  def show
    @current_user = current_user
    
    @single_room = Room.find(params[:id])
    @rooms = Room.public_rooms
    @users = User.all_except(@current_user)
    @room = Room.new
    @message = Message.new
    @messages = @single_room.messages
    render "index"
    
  end
  
  def create
    @room = Room.create(name: params["room"]["name"])
  end
  
end
