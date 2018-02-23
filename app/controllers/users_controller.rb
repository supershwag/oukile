class UsersController < ApplicationController
skip_after_action :verify_authorized

def show
  @user = current_user
  # Items in user profile
  @items = Item.all
  @user_items = []
  @items.each do |item|
    @user_items << item if item.finder = current_user
  end
  # Meetings in user profile
  @loser_meetings = current_user.meetings
  @finder_meetings = Meeting.joins(dispo: :item).where(items: { user_id: current_user.id })
  # @meetings = loser_meetings + finder_meetings
  authorize @user
end

def edit
  @user = current_user
  authorize @user
end

def update
  @user = current_user
  authorize @user
  if current_user.update(user_params)
      redirect_to user_path(current_user)
    else
      render :edit
    end
end

private
    # Never trust parameters from the scary internet, only allow the white list through.
  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :phone_number, :photo)
  end

end
