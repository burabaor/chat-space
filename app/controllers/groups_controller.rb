class GroupsController < ApplicationController
  before_action :find_group, only: [:edit, :update]

  def index
    @groups = Group.all
  end
  def new
    @group = Group.new
  end
  def create
    Group.create(group_params)
    redirect_to :root
  end
  def edit
  end
  def update
    @group.update(group_params)
    redirect_to :root
  end

  private
  def find_group
    @group = Group.find(params[:id])
  end
  def group_params
    params.require(:group).permit(:name, user_ids: [])
  end
end
