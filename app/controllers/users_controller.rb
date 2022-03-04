class UsersController < ApplicationController
  before_action :authenticate_user!

  def index
    @users = User.all_except(current_user)

    @room = Room.new
    @rooms = Room.public_rooms
    @private_rooms = Room.private_rooms(current_user)
  end

  def show
    @user = User.find(params[:id])
    @users = User.all_except(current_user)

    @room = Room.new
    @rooms = Room.public_rooms
    @private_rooms = Room.private_rooms(current_user)
    @room_name = get_name(@user, current_user)
    @single_room = Room.where(name: @room_name).first || Room.create_private_room([@user, current_user], @room_name)

    @message = Message.new
    @messages = @single_room.messages.order(created_at: :asc)
    render "rooms/index"
  end

  def search
    if params[:search].present?
      @users = User.all_except(current_user).search_by_email(params[:search])
    else
      @users = []
    end
    respond_to do |format|
      format.turbo_stream do
        render turbo_stream: turbo_stream.update("search_results",
                                                 partial: "layouts/search_results",
                                                 locals: { users: @users })
      end
    end
  end

  private

  def get_name(user1, user2)
    user = [user1, user2].sort
    "private_#{user[0].id}_#{user[1].id}"
  end
end
