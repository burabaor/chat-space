class GroupsController < ApplicationController
  before_action :find_group, only: [:show, :edit, :update]

  def show
    @all_groups = Group.all
  end
  def new
    @group = Group.new
  end
  def create
    Group.create(create_params)
    redirect_to :root and return
  end
  def edit
  end
  def update
    @group.update(update_params)
    redirect_to :root and return
  end

  private
  def find_group
    @group = Group.find(params[:id])
  end
  def create_params
    params.require(:group).permit(:id, :name)
  end
  def update_params
    params.require(:group).permit(:name)
  end
end
