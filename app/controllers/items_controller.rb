class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :find_params, only: [:show, :edit, :update, :destroy]
  before_action :move_to_index, only: [:edit, :update]
  before_action :buy_check, only: [:edit, :update]
  def index
    @items = Item.order("created_at DESC")
  end

  def new
    @item = Item.new 
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
  end

  def edit
    
  end

  def update
    if @item.update(item_params)
      redirect_to item_path
    else
      render :edit
    end
  end

  def destroy
    if current_user.id == @item.user.id
      @item.destroy
      redirect_to root_path
    else
      render :show
    end
  end

  private
  def item_params
    params.require(:item).permit(:item_name, :price, :information, :prefecture_id, :delivery_fee_id, :shipping_day_id, :category_id, :item_status_id, :image).merge(user_id: current_user.id)
  end

  def move_to_index
    unless @item.user.id == current_user.id
      redirect_to action: :index
    end
  end
  def find_params
    @item = Item.find(params[:id])
  end
  def buy_check
    if @item.purchase.present?
      redirect_to root_path
    end
  end
end
