require 'rails_helper'

RSpec.describe Message, :type => :model do
  describe Message do
    describe '#create' do
    # invalid
      it "is invalid with empty-message" do
        message = build(:empty_message)
        message.valid?
        expect(message.errors[:body]).to include("を入力してください。")
      end

    # valid
      it 'is valid with all data' do
        message = build(:message)
        message.valid?
        expect(message).to be_valid
      end
    end
  end
end
