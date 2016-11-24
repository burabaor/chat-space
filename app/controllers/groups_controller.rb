class GroupsController < ApplicationController
  def new
    @group = Group.new
  end
  def create
    Group.create(create_params)
    redirect_to root and return
  end

  private
  def create_params
    params.require(:group).permit(:id, :name)
  end
end
