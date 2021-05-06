class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  access all: [:index, :show, :new, :edit, :create, :update, :destroy], user: :all

  # GET /users

  def index    
    if current_user
     # @users = User.includes(:posts).all
     @user = current_user

    else
      redirect_to new_user_session_path, notice: 'You are not logged in.'
    end
  end

  # GET /users/1
  def show

  end

  # DELETE /users/1
  def destroy
    @user.destroy
    redirect_to users_url, notice: 'User was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end



    # Only allow a trusted parameter "white list" through.
    def user_params
      params[:user]
    end
end
