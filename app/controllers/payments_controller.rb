class PaymentsController < ApplicationController
  
  require "payjp"


  def new
    card = Payment.where(user_id: current_user.id)
  end

  def pay 
    Payjp.api_key = Rails.application.credentials.payjp[:payjp_private_key]
    if params["payjpToken"].blank?
    redirect_to action: "show"
    else
      customer = Payjp::Customer.create(card: params["payjpToken"],metadata: {user_id: current_user.id})
      @card = Payment.new(user_id: current_user.id, customer_id: customer.id, card_id: customer.default_card)

      if @card.save
        redirect_to action: "show"
        flash[:notice] = 'クレジットカードの登録が完了しました'
      else
        redirect_to action: "new"
        flash[:alert] = 'クレジットカード登録に失敗しました'
      end
    end
  end

  def delete 
    card = Payment.where(user_id: current_user.id).first
    if card.blank?
    else
      Payjp.api_key = Rails.application.credentials.payjp[:payjp_private_key]
      customer = Payjp::Customer.retrieve(card.customer_id)
      customer.delete
      card.delete
    end
      redirect_to action: "new"
  end


 def show 
  card = Payment.find_by(user_id: current_user.id)
  if card.blank?
    redirect_to action: "new" 
  else
    Payjp.api_key = Rails.application.credentials.payjp[:payjp_private_key]
    customer = Payjp::Customer.retrieve(card.customer_id)
    @default_card_information = customer.cards.retrieve(card.card_id)
  end
end

end