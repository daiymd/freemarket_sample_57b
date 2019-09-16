class PurchaseController < ApplicationController
  before_action :set_product, only: [:index, :done, :pay]
  before_action :confirm
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
    @transaction = Transaction.find_by(product_id: @product.id)
    if @transaction.seller_id == current_user.id
      redirect_to root_path
    elsif @transaction.buyer_id == nil
      card = Payment.where(user_id: current_user.id).first
      Payjp.api_key = Rails.application.credentials.payjp[:payjp_private_key]
      Payjp::Charge.create(
        amount: @product.price, 
        customer: card.customer_id, 
        currency: 'jpy', 
        )
        @transaction.update(buyer_id: current_user.id)
      redirect_to action: 'done' 
    else
      redirect_to root_path
    end
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

  def confirm
    @transaction = Transaction.find_by(product_id: @product.id)
    if @transaction.buyer_id != nil
      redirect_to root_path
    end
  end
end