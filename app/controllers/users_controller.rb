class UsersController < ApplicationController
  before_action :authorize, only: [:show, :index]

  def show
    user = User.find_by(id: session[:user_id])

    if user
      render json: user
    else
      render json: { error: 'User not found' }, status: :not_found
    end
  end

  def index
    users = User.all
    render json: users
  end

  private

  def authorize
    return render json: { error: 'Not authorized' }, status: :unauthorized unless session[:user_id].present?
  end
end
