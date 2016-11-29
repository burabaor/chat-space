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
        format.json { render json: params_for_json(message) }
      end
    else
      flash[:alert] = "メッセージを入力してください"
      redirect_to_messages_index
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
  def params_for_json(data)
    new_params = {user_name: current_user.name, created_at: data.created_at, body: data.body}
  end
end
