class RoomsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_status

  def index
    @room = Room.new
    @rooms = Room.public_rooms
    @private_rooms = Room.private_rooms(current_user)

    @users = User.all_except(current_user)
  end

  def show
    @single_room = Room.find(params[:id])

    @room = Room.new
    @rooms = Room.public_rooms
    @private_rooms = Room.private_rooms(current_user)

    @message = Message.new
    @messages = @single_room.messages.order(created_at: :asc)

    @users = User.all_except(current_user)

    render 'index'
  end

  def create
    @room = Room.create(name: params["room"]["name"])
  end

  private

  def set_status
    current_user.update!(status: User.statuses[:online]) if current_user
  end
end
