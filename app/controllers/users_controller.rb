class UsersController < ApplicationController
skip_after_action :verify_authorized

def show
  @user = current_user
  authorize @user
end

def edit
  @user = current_user
  authorize @user
end

def update
<<<<<<< HEAD
  if current_user.update(user_params)
      redirect_to user_path(current_user)
    else
      render :edit
    end
=======
  current_user.update(user_params)
  authorize @user
>>>>>>> master
end

private
    # Never trust parameters from the scary internet, only allow the white list through.
  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :phone_number, :photo)
  end

end
