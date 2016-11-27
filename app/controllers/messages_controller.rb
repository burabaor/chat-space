class MessagesController < ApplicationController
  before_action :find_group
  def index
    @message = Message.new
  end
  def create
    message = Message.new(create_params)
    flash[:alert] = "メッセージを入力してください" unless message.save
    redirect_to group_messages_path(@group)
  end

  private
  def find_group
    @group = Group.find(params[:group_id])
  end
  def create_params
    params.require(:message).permit(:body).merge(group_id: @group.id, user_id: current_user.id)
  end
end
