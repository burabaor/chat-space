require 'rails_helper'

RSpec.describe MessagesController, :type => :controller do
  let(:group) { create(:group) }
  let(:user) { create(:user) }
  let(:message) { { message: attributes_for(:message), group_id: group.id } }

  context 'not sign_in user' do
    describe 'GET #index' do
      it "renders the :index template" do
        get :index, group_id: group.id
        expect(response).to redirect_to new_user_session_path
      end
    end
    describe 'POST #create' do
      it "renders the :index template" do
        post :create, message
        expect(response).to redirect_to new_user_session_path
      end
    end
  end

  context 'sign_in user' do
    before do
      sign_in user
    end
    # index
    describe 'GET #index' do
      before do
        get :index, group_id: group.id
      end
      it "renders the :index template" do
        expect(response).to render_template :index
      end
      it "assigns the requested contact to @group" do
        expect(assigns(:group)).to eq group
      end
    end

    # create
    describe 'POST #create' do
      it "renders the :index template" do
        post :create, message
        expect(response).to redirect_to group_messages_path(group)
      end
      it "has a text in flash-alert when message is empty" do
        message[:message][:body] = ""
        post :create, message
        expect(flash[:alert]).to eq "メッセージを入力してください"
      end
      it "has one more message when message is saved" do
        expect{ post :create, message }.to change{ Message.count }.by(1)
      end
    end
  end
end
