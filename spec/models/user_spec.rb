require 'rails_helper'

describe User do
  describe 'registration#new' do
    it "is valid with a name, nickname, furigana, email, password, password_confirmation, birthday, tell" do
      user = FactoryBot.build(:user)
      expect(user).to be_valid
    end
  end
end