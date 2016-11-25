class MessagesController < ApplicationController
  def index
    @group = Group.find(params[:group_id])
    @groups = Group.all
    @message = Message.new
    @messages = Message.where(group_id: params[:group_id])
  end
  def create
    message = Message.create(create_params)
    if message.body.blank?
      flash[:alert] = "メッセージを入力してください"
    end
    redirect_to :back
  end

  private
  def create_params
    params.require(:message).permit(:body).merge(group_id: params[:group_id], user_id: current_user.id)
  end
end
