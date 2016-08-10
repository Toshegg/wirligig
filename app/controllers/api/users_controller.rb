class Api::UsersController < ApplicationController
  before_action :check_if_admin
  def index
    @users = User.filtered_by(filter_params)

    respond_with @users
  end

  def update
    @user = User.find(params[:id])

    @user.update(permitted_params)

    respond_with @user
  end

  private

  def permitted_params
    params.require(:user).permit(:is_admin, :is_partner)
  end

  def filter_params
    params.permit(:except_id)
  end
end
