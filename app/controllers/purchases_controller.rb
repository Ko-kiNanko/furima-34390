class PurchasesController < ApplicationController
before_action :authenticate_user!, only: :index
before_action :item_params, only: [:index, :create]
before_action :buy_check, only: :index
before_action :move_to_root, only: [:index, :create]
  def index
    @purchase_detail = PurchaseDetail.new
  end

  def create
    @purchase_detail = PurchaseDetail.new(purchase_params)
    if @purchase_detail.valid?
      pay_item
      @purchase_detail.save
      return redirect_to root_path
    else
      render :index
    end
  end

  private
  def purchase_params
    params.require(:purchase_detail).permit(:prefecture_id, :post_number, :municipality, :address, :phone_number, :building_name).merge(user_id: current_user.id, item_id: @item.id, token: params[:token])
  end
  def item_params
    @item = Item.find(params[:item_id])
  end
  def move_to_root
    unless @item.user.id == current_user.id
      redirect_to controller: :items, action: :index
    end
  end
  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item.price,
      card: purchase_params[:token],
      currency: 'jpy'
    )
  end
  def buy_check
    if @item.purchase.present?
      redirect_to root_path
    end
  end
end
