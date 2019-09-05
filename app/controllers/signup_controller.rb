class SignupController < ApplicationController

  def member
    @user = User.new
  end

  def tell
    session[:nickname] = user_params[:nickname]
    session[:family_name] = user_params[:family_name]
    session[:first_name] = user_params[:first_name]
    session[:family_name_kana] = user_params[:family_name_kana]
    session[:first_name_kana] = user_params[:first_name_kana]
    session[:email] = user_params[:email]
    session[:password] = user_params[:password]
    session[:password_confirmation] = user_params[:password_confirmation]
    session[:year] = user_params[:year]
    session[:month] = user_params[:month]
    session[:day] = user_params[:day]
    @user = User.new
  end

  def address
    session[:tell] = user_params[:tell]
    @address = StreetAddress.new
  end

  def pay
    
  end

  def create
    @address = StreetAddress.new(address_params)
    if session[:password] == "" #sns登録なら
      session[:password] = "Devise.friendly_token.first(6)" #deviseのパスワード自動生成機能を使用
      session[:password_confirmation] = "Devise.friendly_token.first(6)"
    else #email登録なら
      
    end
    @user = User.new(
      nickname: session[:nickname],
      family_name: session[:family_name],
      first_name: session[:first_name],
      family_name_kana: session[:family_name_kana],
      first_name_kana: session[:first_name_kana],
      email: session[:email],
      password: session[:password],
      password_confirmation: session[:password_confirmation],
      year: session[:year],
      month: session[:month],
      day: session[:day],
      tell: session[:tell]
    )
    if @user.save 
      @address.update(user_id:  @user.id)
      if @address.save
        redirect_to completion_signup_index_path
      else
        redirect_to "/users/signup"
      end
    else
      redirect_to "/users/signup"
    end
  end

  private
  def user_params
    params.require(:user).permit(
      :nickname, 
      :family_name, 
      :first_name, 
      :family_name_kana, 
      :first_name_kana, 
      :year,
      :month,
      :day,
      :tell,
      :email, 
      :password, 
      :password_confirmation)
  end

  def address_params
    params.require(:street_address).permit(
      :prefecture,
      :city,
      :postal_code,
      :building_name,
      :address,
      :address_family_name,
      :address_first_name,
      :address_family_name_kana,
      :address_first_name_kana,
      :address_tell,
      :user_id
    )
  end
end