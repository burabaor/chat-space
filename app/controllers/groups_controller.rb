class GroupsController < ApplicationController
  def new
    @group = Group.new
  end
  def create
    Group.create(create_params)
    redirect_to :root and return
  end
  def edit
    @group = find_group
  end
  def update
    @group = find_group
    @group.update(update_params)
    redirect_to :root and return
  end

  private
  def find_group
    Group.find(params[:id])
  end
  def create_params
    params.require(:group).permit(:id, :name)
  end
  def update_params
    params.require(:group).permit(:name)
  end
end
