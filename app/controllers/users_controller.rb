# app/controllers/users_controller.rb

class UsersController < ApplicationController

  def index
    @users = User.all
  end

  def new
    @user_form = UserForm.new
  end

  def create
    @user_form = UserForm.new(user_params)
    if @user_form.save
      redirect_to root_path, notice: "User created successfully"
    else
      render :new
    end
  end

  private

  def user_params
    params.require(:user_form).permit(:name, :email, :password)
  end
end
