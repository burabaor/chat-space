require 'rails_helper'

describe User do
  describe '#create' do

  # invalid
    it "is invalid without a name" do
     user = build(:user, name: "")
     user.valid?
     expect(user.errors[:name]).to include("を入力してください。")
    end
    it "is invalid without an email" do
     user = build(:user, email: "")
     user.valid?
     expect(user.errors[:email]).to include("を入力してください。")
    end
    it "is invalid without a password" do
     user = build(:user, password: "")
     user.valid?
     expect(user.errors[:password]).to include("を入力してください。")
    end
    it "is invalid without a password_confirmation" do
     user = build(:user, password_confirmation: "")
     user.valid?
     expect(user.errors[:password_confirmation]).to include("とパスワードの入力が一致しません。")
    end
    it "is invalid if password and password_confirmation don't match" do
     user = build(:user, :password_confirmation)
     user.valid?
     expect(user.errors[:password_confirmation]).to include("とパスワードの入力が一致しません。")
    end

    it "is invalid with existing email" do
      user = create(:user)
      anothor_user = build(:user)
      anothor_user.valid?
      expect(anothor_user.errors[:email]).to include("はすでに存在します。")
    end

  # valid
    it "is valid with all data" do
      user = build(:user)
      user.valid?
      expect(user).to be_valid
    end
  end
end
