class UsersController < ApplicationController
  def index
    users = User.where(['name LIKE ?', "%#{params[:input]}%"])
    render json: users
  end
end
