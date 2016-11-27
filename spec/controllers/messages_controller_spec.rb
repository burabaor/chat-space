require 'rails_helper'

RSpec.describe MessagesController, :type => :controller do
  let(:group) { create(:group) }
  let(:user) { create(:user) }
  let(:message) { { message: attributes_for(:message), group_id: group.id } }

  before do
    sign_in user
  end

  # index
  describe 'GET #index' do
    it "renders the :index template" do
      get :index, group_id: group.id
      expect(response).to render_template :index
    end
  end

  # create
  describe 'POST #create' do
    it "renders the :index template" do
      post :create, message
      expect(response).to redirect_to group_messages_path(group)
    end
  end
end
