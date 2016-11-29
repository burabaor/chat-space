class MessagesController < ApplicationController
  before_action :find_group
  def index
    @message = Message.new
  end
  def create
    message = Message.new(create_params)
    if message.save
      respond_to do |format|
        format.html { redirect_to_messages_index }
        format.json { render json: message.params_for_json }
      end
    else
      flash[:alert] = "メッセージを入力してください"
      respond_to do |format|
        format.html { redirect_to_messages_index }
        format.json { render json: "" }
      end
    end
  end

  private
  def find_group
    @group = Group.find(params[:group_id])
  end
  def create_params
    params.require(:message).permit(:body).merge(group_id: @group.id, user_id: current_user.id)
  end
  def redirect_to_messages_index
    redirect_to group_messages_path(@group)
  end
end
