class MessagesController < ApplicationController
  def index
    @group = Group.find(params[:group_id])
    @groups = Group.all
    @message = Message.new
  end
  def create
    message = Message.new(create_params)
    flash[:alert] = "メッセージを入力してください" unless message.save
    redirect_to :back
  end

  private
  def create_params
    params.require(:message).permit(:body).merge(group_id: params[:group_id], user_id: current_user.id)
  end
end
