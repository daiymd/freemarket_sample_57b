class PaymentsController < ApplicationController
  
  require "payjp"


  def new
    card = Payment.where(user_id: current_user.id)
    
  end

  def pay #クレジットカード登録
    Payjp.api_key = ENV["PAYJP_PRIVATE_KEY"]
    if params["payjpToken"].blank?
    # paramsの中にjsで作った'payjpTokenが存在するか確かめる
    redirect_to action: "show"
    else
      customer = Payjp::Customer.create(card: params["payjpToken"],metadata: {user_id: current_user.id})

     # ↑ここでpay.jpに保存
      @card = Payment.new(user_id: current_user.id, customer_id: customer.id, card_id: customer.default_card)
      
     # ここでdbに保存
      if @card.save
        redirect_to action: "show"
        flash[:notice] = 'クレジットカードの登録が完了しました'
      else
        redirect_to action: "new"
        flash[:alert] = 'クレジットカード登録に失敗しました'
      end
    end
  end

  def delete #PayjpとCardデータベースを削除します
    card = Card.where(user_id: current_user.id).first
    if card.blank?
    else
      Payjp.api_key = ENV["PAYJP_PRIVATE_KEY"]
      customer = Payjp::Customer.retrieve(card.customer_id)
      customer.delete
      card.delete
    end
      redirect_to action: "new"
  end


 def show #Cardのデータpayjpに送り情報を取り出します
  card = Payment.where(user_id: current_user.id).first
  if card.blank?
    redirect_to action: "new" 
  else
    Payjp.api_key = ENV["PAYJP_PRIVATE_KEY"]
    customer = Payjp::Customer.retrieve(card.customer_id)
    @default_card_information = customer.cards.retrieve(card.card_id)
  end
end

