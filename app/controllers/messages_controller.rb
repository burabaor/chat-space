class MessagesController < ApplicationController
  def index
    @group = Group.find(params[:group_id])
    @message = Message.new
    @groups = Group.all
  end
  def create
    Message.create(create_params)
    redirect_to :back
  end

  private
  def create_params
    params.require(:message).permit(:body).merge(group_id: params[:group_id], user_id: current_user.id)
  end
end
