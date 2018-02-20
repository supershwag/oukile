class UserController < ApplicationController

def show
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
  end

end
