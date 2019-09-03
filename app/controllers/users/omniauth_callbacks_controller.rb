# frozen_string_literal: true

class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  
  def facebook
    callback_for(:facebook) #コールバック
  end

  def google_oauth2
    callback_for(:google)
  end

  def callback_for(provider)
    info = User.find_oauth(request.env["omniauth.auth"]) #usersモデルのメソッド
    @user = info[:user]
    sns_id = info[:sns_id]
    if @user.persisted? #userが存在したら
      sign_in_and_redirect @user, event: :authentication
      set_flash_message(:notice, :success, kind: "#{provider}".capitalize) if is_navigational_format?
    else #userが存在しなかったら
      session["devise.#{provider}_data"] = request.env["omniauth.auth"].except("extra")
      render template: "devise/registrations/new" #redirect_to だと更新してしまうのでrenderで
    end
  end

  def failure
    redirect_to root_path and return
  end
end
