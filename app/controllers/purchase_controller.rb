class PurchaseController < ApplicationController
  before_action :set_product, only: [:index, :done]
  require 'payjp'

  def index
    card = Payment.where(user_id: current_user.id).first
    @image = @product.images[0]
    if card.blank?
      redirect_to new_payment_path, controller: "card", action: "new"
    else
      Payjp.api_key = Rails.application.credentials.payjp[:payjp_private_key]
      customer = Payjp::Customer.retrieve(card.customer_id)
      @default_card_information = customer.cards.retrieve(card.card_id)
    end
  end

  def pay
    card = Payment.where(user_id: current_user.id).first
    Payjp.api_key = Rails.application.credentials.payjp[:payjp_private_key]
    Payjp::Charge.create(
    amount: 61500, 
    customer: card.customer_id, 
    currency: 'jpy', 
  )
  redirect_to action: 'done' 
  end

  def done
    @image = @product.images[0]
    card = Payment.where(user_id: current_user.id).first
    Payjp.api_key = Rails.application.credentials.payjp[:payjp_private_key]
      customer = Payjp::Customer.retrieve(card.customer_id)
      @default_card_information = customer.cards.retrieve(card.card_id)
  end

  private

  def set_product
    @product = Product.find(params[:product_id])
  end
end