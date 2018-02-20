class UsersController < ApplicationController

authorize @user
def show
  @user = current_user
end

def edit
  @user = current_user
end

def update
  current_user.update(user_params)
end

private
    # Never trust parameters from the scary internet, only allow the white list through.
  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :phone_number)
  end

end
