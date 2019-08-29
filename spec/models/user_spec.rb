require 'rails_helper'

describe User do
  describe 'registration#new' do
    it "is valid with a name, nickname, furigana, email, password, password_confirmation, birthday, tell" do
      user = FactoryBot.build(:user)
      expect(user).to be_valid
    end

    it "is invalid without a name" do
      user = FactoryBot.build(:user, name: nil)
      user.valid?
      expect(user.errors[:name]).to include("can't be blank")
    end

    it "is invalid without a nickname" do
      user = FactoryBot.build(:user, nickname: nil)
      user.valid?
      expect(user.errors[:nickname]).to include("can't be blank")
    end

    it "is invalid without a furigana" do
      user = FactoryBot.build(:user, furigana: nil)
      user.valid?
      expect(user.errors[:furigana]).to include("can't be blank")
    end

    it "is invalid without a email" do
      user = FactoryBot.build(:user, email: nil)
      user.valid?
      expect(user.errors[:email]).to include("can't be blank")
    end

    it "is invalid without a password" do
      user = FactoryBot.build(:user, password: nil)
      user.valid?
      expect(user.errors[:password]).to include("can't be blank")
    end

    it "is invalid without a password_confirmation" do
      user = FactoryBot.build(:user, password_confirmation: nil)
      user.valid?
      expect(user.errors[:password_confirmation]).to include("can't be blank")
    end

    it "is invalid without a birthday" do
      user = FactoryBot.build(:user, birthday: nil)
      user.valid?
      expect(user.errors[:birthday]).to include("can't be blank")
    end

    it "is invalid without a tell" do
      user = FactoryBot.build(:user, tell: nil)
      user.valid?
      expect(user.errors[:tell]).to include("can't be blank")
    end
  end
end