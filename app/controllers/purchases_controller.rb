class PurchasesController < ApplicationController
before_action :authenticate_user!, expect: :index

  def index
    @purchase_detail = PurchaseDetail.new
    @item = Item.find(params[:item_id])
  end

  def new
  end

  def create
    @item = Item.find(params[:item_id])
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
  def move_to_root
    @item = Item.find(params[:item_id])
    unless @item.user.id == current_user.id
      redirect_to controller: :items, action: :index
    end
  end
  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: Item.find(params[:item_id]).price,
      card: purchase_params[:token],
      currency: 'jpy'
    )
  end
end
